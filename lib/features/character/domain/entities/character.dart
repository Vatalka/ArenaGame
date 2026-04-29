import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

part 'character.g.dart';

@freezed
class Character with _$Character {
  const Character._();

  const factory Character({
    required String name,
    required int currentHp,
    required int vitality,
    required int strength,
    required int precision,
    required int agility,
  }) = _Character;

  int get maxHp => vitality * 10;

  factory Character.createDefault(String name) {
    const defaultVitality = 5;
    return Character(
      name: name,
      currentHp: defaultVitality * 10,
      vitality: defaultVitality,
      strength: 5,
      precision: 5,
      agility: 5,
    );
  }

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
