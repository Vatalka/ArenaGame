import 'package:arena_game/features/character/data/models/character_model.dart';
import 'package:hive/hive.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';

class CharacterRepositoryImpl implements ICharacterRepository {
  static const String _characterBox = 'character_box';

  @override
  Future<void> saveCharacter(Character character, int slot) async {
    if (slot < 1 || slot > 3) {
      throw Exception('Only slots 1 to 3 are allowed');
    }
    final box = await Hive.openBox<Map>(_characterBox);
    final characterModel = CharacterModel.fromEntity(character);
    final characterMap = characterModel.toJson();
    await box.put('character_$slot', characterMap);
  }

  @override
  Future<Character?> getCharacter(int slot) async {
    final box = await Hive.openBox<Map>(_characterBox);
    final characterMap = box.get('character_$slot');

    if (characterMap == null) return null;
    final Map<String, dynamic> targetMap = Map<String, dynamic>.from(
      characterMap,
    );
    final characterModel = CharacterModel.fromJson(targetMap);
    return characterModel.toEntity();
  }

  @override
  Future<List<Character>> getAllCharacters() async {
    final box = await Hive.openBox<Map>(_characterBox);
    return box.values.map((data) {
      final model = CharacterModel.fromJson(Map<String, dynamic>.from(data));
      return model.toEntity();
    }).toList();
  }

  @override
  Future<void> deleteCharacter(int slot) async {
    final box = await Hive.openBox<Map>(_characterBox);
    await box.delete('character_$slot');
  }
}
