import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/character_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_repository_impl.g.dart';

@Riverpod(keepAlive: true)
CharacterRepository characterRepository(Ref ref) {
  return CharacterRepositoryImpl();
}

class CharacterRepositoryImpl implements CharacterRepository {
  @override
  Character getCharacter(String name) {
    if (name == 'Enemy') {
      int vit = 7;
      return Character(
        name: name,
        currentHp: vit * 10,
        vitality: vit,
        strength: 3,
        precision: 6,
        agility: 4,
      );
    }
    return Character.createDefault(name);
  }
}
