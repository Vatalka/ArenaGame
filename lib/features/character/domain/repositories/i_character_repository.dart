import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'i_character_repository.g.dart';

abstract interface class ICharacterRepository {
  Future<void> saveCharacter(Character newCharacter);

  Future<Character?> getCharacter();
}

@riverpod
ICharacterRepository characterRepository(Ref ref) {
  throw UnimplementedError(
    'Override in main.dart',
  );
}

@riverpod
Future<Character?> activeCharacter(Ref ref) async {
  final repository = ref.watch(characterRepositoryProvider);
  return await repository.getCharacter();
}
