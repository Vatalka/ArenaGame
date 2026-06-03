import 'dart:async';
import 'package:arena_game/features/game/battle/presentation/controllers/battle_notifier.dart';
import 'package:arena_game/features/game/player/player_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'regeneration_notifier.g.dart';

@Riverpod(keepAlive: true)
class Regeneration extends _$Regeneration {
  Timer? _timer;

  @override
  build() {
    final isCombatMode = ref.watch(
      battleProvider.select((state) => state.isBotMode),
    );

    Future.microtask(() {
      if (isCombatMode) {
        _stopTimer();
      } else {
        _initRegen();
      }
    });
  }

  void _initRegen() {
    _offlineRegen();
    _startTimer();
  }

  void _offlineRegen() {
    final playerNotifier = ref.read(playerProvider.notifier);
    final player = playerNotifier.state;

    if (player.lastUpdateTime != 0 && player.currentHp < player.maxHp) {
      final newHp = player.actualHp;

      playerNotifier.updateHp(newHp);
    }
  }

  void _startTimer() {
    _stopTimer();

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      final playerNotifier = ref.read(playerProvider.notifier);
      final player = playerNotifier.state;

      if (player.currentHp >= player.maxHp) {
        _stopTimer();
        return;
      }

      final regenAmount = (player.maxHp * 0.01).ceil();
      final newHp = (player.currentHp + regenAmount).clamp(0, player.maxHp);

      playerNotifier.updateHp(newHp);
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
