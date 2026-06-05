import 'dart:async';
import 'package:arena_game/features/character/presentation/controllers/selection_notifier.dart';
import 'package:arena_game/features/game/battle/presentation/controllers/battle_notifier.dart';
import 'package:arena_game/features/game/player/active_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'regeneration_notifier.g.dart';

@Riverpod(keepAlive: true)
class Regeneration extends _$Regeneration {
  Timer? _timer;

  @override
  void build() {
    final isCombatMode = ref.watch(
      battleProvider.select((state) => state.isBotMode),
    );

    if (!isCombatMode) {
      _startRegen();
    } else {
      _stopRegen();
    }
    ref.onDispose(() => _stopRegen());
  }

  void _startRegen() {
    if (_timer != null) return;

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      final player = ref.read(activePlayerProvider);

      if (player.id != '' && player.currentHp < player.maxHp) {
        final regenAmount = (player.maxHp * 0.01).ceil();
        final newHP = (player.currentHp + regenAmount).clamp(0, player.maxHp);

        ref
            .read(selectionProvider.notifier)
            .updateCharacterHP(player.id, newHP);
      }

      if (player.id != '' && player.currentHp >= player.maxHp) {
        _stopRegen();
        return;
      }
    });
  }

  void _stopRegen() {
    _timer?.cancel();
    _timer = null;
  }
}
