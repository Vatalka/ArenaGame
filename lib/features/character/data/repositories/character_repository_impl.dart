import 'package:arena_game/features/character/data/models/character_model.dart';
import 'package:hive/hive.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';

class CharacterRepositoryImpl implements ICharacterRepository {
  static const String _characterBoxName = 'character_box';
  static const String _characterKey = 'current_character';

  @override
  Future<void> saveCharacter(Character character) async {
    final box = await Hive.openBox<Map>(_characterBoxName);
    final characterModel = CharacterModel.fromEntity(character);
    final characterMap = characterModel.toJson();
    await box.put(_characterKey, characterMap);
  }

  @override
  Future<Character?> getCharacter() async {
    final box = await Hive.openBox<Map>(_characterBoxName);
    final characterMap = box.get(_characterKey);

    if (characterMap == null) return null;
    final Map<String, dynamic> targetMap = Map<String, dynamic>.from(
      characterMap,
    );
    final characterModel = CharacterModel.fromJson(targetMap);
    return characterModel.toEntity();
  }

  @override
  Future<List<Character>> getAllCharacters() async {
    final box = await Hive.openBox<Map>(_characterBoxName);
    return box.values.map((data) {
      final model = CharacterModel.fromJson(Map<String, dynamic>.from(data));
      return model.toEntity();
    }).toList();
  }

  @override
  Future<void> deleteCharacter() async {
    final box = await Hive.openBox<Map>(_characterBoxName);
    await box.delete(_characterKey);
  }
}
