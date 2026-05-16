import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_notifier.g.dart';

@Riverpod(keepAlive: true)
class CharacterNotifier extends _$CharacterNotifier {
  @override
  Character build() => Character.createDefault();

  Future<void> saveCreatedCharacter() async {
    final repository = ref.read(characterRepositoryProvider);
    await repository.saveCharacter(state);
    ref.invalidate(activeCharacterProvider);
  }

  void updateName(String name) => state = state.copyWith(name: name);
}
