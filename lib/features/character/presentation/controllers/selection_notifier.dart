import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selection_notifier.g.dart';

@riverpod
class SelectionNotifier extends _$SelectionNotifier {
  @override
  FutureOr<List<Character>> build() async {
    return _loadCharacters();
  }

  Future<List<Character>> _loadCharacters() async {
    final rawCharacters = await ref
        .watch(characterRepositoryProvider)
        .getAllCharacters();
    final updatedCharacters = <Character>[];

    for (var char in rawCharacters) {
      if (char.currentHp < char.maxHp && char.lastUpdateTime != 0) {
        final actualHealth = char.actualHp;

        if (actualHealth > char.currentHp) {
          char = char.copyWith(
            currentHp: actualHealth,
            lastUpdateTime: DateTime.now().millisecondsSinceEpoch,
          );
          await ref.read(characterRepositoryProvider).saveCharacter(char);
        }
      }
      updatedCharacters.add(char);
    }

    return updatedCharacters;
  }

  Future<void> removeCharacter(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(characterRepositoryProvider).deleteCharacter(id);
      return _loadCharacters();
    });
    ref.invalidateSelf();
  }
}
