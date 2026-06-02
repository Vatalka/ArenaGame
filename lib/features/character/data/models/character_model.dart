import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';

part 'character_model.g.dart';

@freezed
abstract class CharacterModel with _$CharacterModel {
  const factory CharacterModel({
    required String id,
    required String name,
    required int currentHp,
    required int vitality,
    required int strength,
    required int lastUpdateTime,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  factory CharacterModel.fromEntity(Character character) {
    return CharacterModel(
      id: character.id,
      name: character.name,
      currentHp: character.currentHp,
      strength: character.strength,
      vitality: character.vitality,
      lastUpdateTime: character.lastUpdateTime,
    );
  }
}

extension CharacterModelX on CharacterModel {
  Character toEntity() {
    return Character(
      id: id,
      name: name,
      currentHp: currentHp,
      strength: strength,
      vitality: vitality,
      lastUpdateTime: lastUpdateTime,
    );
  }
}
