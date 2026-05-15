import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'i_character_repository.g.dart';

abstract interface class ICharacterRepository {
  Future<void> saveCharacter(Character newCharacter);

  Character? getCharacter();
}

@riverpod
ICharacterRepository characterRepository(Ref ref) {
  throw UnimplementedError(
    'Має бути перевизначений у main.dart',
  );
}

@riverpod
Character? activeCharacter(Ref ref) {
  final repository = ref.watch(characterRepositoryProvider);
  return repository.getCharacter();
}
