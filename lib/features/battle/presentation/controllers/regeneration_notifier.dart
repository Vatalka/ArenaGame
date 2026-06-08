import 'dart:async';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/presentation/controllers/selection_notifier.dart';
import 'package:arena_game/features/battle/presentation/controllers/battle_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'regeneration_notifier.g.dart';

@Riverpod(keepAlive: true)
class RegenerationNotifier extends _$RegenerationNotifier {
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
      final selectionState = ref.read(selectionProvider);

      if (selectionState is AsyncData<List<Character>>) {
        final characters = selectionState.value;
        for (final char in characters) {
          if (char.currentHp < char.maxHp) {
            final newHp = (char.currentHp + char.regenPerTick).clamp(
              0,
              char.maxHp,
            );

            ref
                .read(selectionProvider.notifier)
                .updateCharacterHP(char.id, newHp);
          }
        }
      }
    });
  }

  void _stopRegen() {
    _timer?.cancel();
    _timer = null;
  }
}
