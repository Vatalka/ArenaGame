import 'dart:async';
import 'dart:math';
import 'package:arena_game/features/battle/presentation/controllers/battle_notifier.dart';
import 'package:arena_game/features/battle/presentation/controllers/log/battle_log_notifier.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_notifier.g.dart';

@Riverpod(keepAlive: true)
class PlayerNotifier extends _$PlayerNotifier {
  Timer? _regenTimer;

  @override
  Character build() {
    ref.onDispose(() => _stopRegen());
    _startRegen();
    return Character.createDefault();
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

  void selectCharacter(Character character) => state = character;

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
  }
}
