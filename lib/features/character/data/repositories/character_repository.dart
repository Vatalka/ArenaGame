import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/character_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_repository.g.dart';

@Riverpod(keepAlive: true)
CharacterRepository characterRepository(Ref ref) {
  return CharacterRepositoryImpl();
}

class CharacterRepositoryImpl implements CharacterRepository {
  @override
  Character getHero(String name) {
    return Character.createDefault(name);
  }
}
