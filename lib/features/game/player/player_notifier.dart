import 'dart:async';
import 'dart:math';
import 'package:arena_game/features/game/battle/presentation/controllers/battle_notifier.dart';
import 'package:arena_game/features/game/log/presentation/controllers/battle_log_notifier.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_notifier.g.dart';

@Riverpod(keepAlive: true)
class PlayerNotifier extends _$PlayerNotifier with WidgetsBindingObserver {
  Timer? _regenTimer;

  @override
  Character build() {
    WidgetsBinding.instance.addObserver(this);

    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
      _stopRegen();
    });

    _startRegen();
    return Character.createDefault();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      _stopRegen();
      savePlayerState();
    }

    if (state == AppLifecycleState.resumed) {
      _applyOfflineRegeneration();
      _startRegen();
    }
  }

  void _startRegen() {
    _stopRegen();
    _regenTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      final isBattleActive = ref.read(battleProvider).isBotMode;
      if (isBattleActive) return;
      if (state.currentHp >= state.maxHp) return;

      final regenAmount = (state.maxHp * 0.01).ceil();
      state = state.copyWith(
        currentHp: min(state.currentHp + regenAmount, state.maxHp),
      );
    });
  }

  void _stopRegen() {
    _regenTimer?.cancel();
    _regenTimer = null;
  }

  Future<void> savePlayerState() async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    state = state.copyWith(lastUpdateTime: currentTime);
    try {
      await ref.read(characterRepositoryProvider).saveCharacter(state);
    } catch (e) {
      debugPrint('Помилка збереження гравця: $e');
    }
  }

  void selectCharacter(Character character) {
    if (state.lastUpdateTime != 0) {
      savePlayerState();
    }
    state = character;
    _applyOfflineRegeneration();
    _startRegen();
  }

  void _applyOfflineRegeneration() {
    if (state.lastUpdateTime == 0 || state.currentHp >= state.maxHp) return;

    final int now = DateTime.now().millisecondsSinceEpoch;
    final int differenceInMs = now - state.lastUpdateTime;
    final int secondsPassed = differenceInMs ~/ 1000;
    final int totalTicks = secondsPassed ~/ 2;

    if (totalTicks > 0) {
      final int hpPerTick = (state.maxHp * 0.01).ceil();
      final int totalHpRegenerated = totalTicks * hpPerTick;

      state = state.copyWith(
        currentHp: min(state.currentHp + totalHpRegenerated, state.maxHp),
        lastUpdateTime: now,
      );
    }
  }

  void takeDamage(int amount) {
    state = state.copyWith(
      currentHp: (state.currentHp - amount).clamp(0, state.maxHp),
    );
  }

  void restoreHp() {
    state = state.copyWith(currentHp: state.maxHp);
    ref
        .read(battleLogProvider.notifier)
        .addInfoLog('Гравець відновлює здоровля');
    savePlayerState();
  }
}
