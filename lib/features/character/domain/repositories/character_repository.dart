import '../entities/character.dart';

abstract class CharacterRepository {
  Character getCharacter(String name);
}
