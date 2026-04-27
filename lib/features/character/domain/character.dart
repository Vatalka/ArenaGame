import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

part 'character.g.dart';

@freezed
class Character with _$Character {
  const factory Character({
    required String name,
    required int hp,
    required int maxHp,
    required int vitality,
    required int strength,
    required int precision,
    required int agility,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
