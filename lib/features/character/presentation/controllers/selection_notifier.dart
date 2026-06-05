import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selection_notifier.g.dart';

@riverpod
class SelectionNotifier extends _$SelectionNotifier {
  @override
  FutureOr<List<Character>> build() async {
    final repository = ref.watch(characterRepositoryProvider);
    return _loadCharacters(repository);
  }

  Future<List<Character>> _loadCharacters(ICharacterRepository repo) async {
    final rawCharacters = await repo.getAllCharacters();
    final updatedCharacters = <Character>[];

    for (var char in rawCharacters) {
      if (char.currentHp < char.maxHp && char.lastUpdateTime != 0) {
        final actualHealth = char.actualHp;

        if (actualHealth > char.currentHp) {
          char = char.copyWith(
            currentHp: actualHealth,
            lastUpdateTime: DateTime.now().millisecondsSinceEpoch,
          );
          await repo.saveCharacter(char);
        }
      }
      updatedCharacters.add(char);
    }

    return updatedCharacters;
  }

  void updateCharacterHP(String id, int newHp) {
    if (state is AsyncData<List<Character>>) {
      final currentList = state.value!;

      final updatedList = currentList.map((char) {
        if (char.id == id) {
          return char.copyWith(
            currentHp: newHp,
            lastUpdateTime: DateTime.now().millisecondsSinceEpoch,
          );
        }
        return char;
      }).toList();

      final updatedChar = updatedList.firstWhere((char) => char.id == id);
      ref.read(characterRepositoryProvider).saveCharacter(updatedChar);

      state = AsyncData(updatedList);
    }
  }

  Future<void> removeCharacter(String id) async {
    state = const AsyncLoading();
    try {
      await ref.read(characterRepositoryProvider).deleteCharacter(id);
      ref.invalidateSelf();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
