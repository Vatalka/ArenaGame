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
    final hasActivePlayer = ref.watch(
      playerProvider.select((player) => player.name != ''),
    );
    final isCombatMode = ref.watch(
      battleProvider.select((state) => state.isBotMode),
    );

    if (hasActivePlayer && !isCombatMode) {
      Future.microtask(() => _startRegen());
    } else {
      _stopRegen();
    }
    ref.onDispose(() => _stopRegen());
  }

  void _startRegen() {
    _stopRegen();

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      final playerNotifier = ref.read(playerProvider.notifier);
      final player = playerNotifier.state;

      if (player.name != '' || player.currentHp >= player.maxHp) {
        _stopRegen();
        return;
      }

      final regenAmount = (player.maxHp * 0.01).ceil();
      final newHp = (player.currentHp + regenAmount).clamp(0, player.maxHp);

      playerNotifier.updateHp(newHp);
    });
  }

  void _stopRegen() {
    _timer?.cancel();
    _timer = null;
  }
}
