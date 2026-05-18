import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'i_character_repository.g.dart';

abstract interface class ICharacterRepository {
  Future<void> saveCharacter(Character character);

  Future<Character?> getCharacter();

  Future<List<Character>> getAllCharacters();

  Future<void> deleteCharacter();
}

@riverpod
ICharacterRepository characterRepository(Ref ref) {
  return Modular.get<ICharacterRepository>();
}

@riverpod
Future<Character?> activeCharacter(Ref ref) async {
  final repository = ref.watch(characterRepositoryProvider);
  return await repository.getCharacter();
}

