import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:arena_game/features/character/presentation/controllers/selection_notifier.dart';
import 'package:arena_game/features/game/log/presentation/controllers/battle_log_notifier.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:flutter/foundation.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_notifier.g.dart';

@Riverpod(keepAlive: true)
class PlayerNotifier extends _$PlayerNotifier {
  @override
  Character build() => Character.createDefault();

  void selectCharacter(Character character) {
    final selectionState = ref.read(selectionProvider);

    if (selectionState is AsyncData<List<Character>>) {
      final updatedCharacters = selectionState.value;
      final player = updatedCharacters.firstWhere(
        (char) => char.id == character.id,
        orElse: () => character,
      );

      state = player;
      return;
    }
    state = character;
  }

  void takeDamage(int amount) {
    state = state.copyWith(
      currentHp: (state.currentHp - amount).clamp(0, state.maxHp),
    );
  }

  void updateHp(int newHp) {
    if (state.name == '') return;
    state = state.copyWith(
      currentHp: newHp,
      lastUpdateTime: DateTime.now().millisecondsSinceEpoch,
    );
  }

  void restoreHp() {
    state = state.copyWith(currentHp: state.maxHp);
    ref
        .read(battleLogProvider.notifier)
        .addInfoLog('Гравець відновлює здоровля');
    savePlayerState();
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
}
