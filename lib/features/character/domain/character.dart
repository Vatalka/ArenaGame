import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

part 'character.g.dart';

@freezed
class Character with _$Character {
  const Character._();

  const factory Character({
    required String name,
    required int currentHp,
    required int maxHp,
    required int vitality,
    required int strength,
    required int precision,
    required int agility,
  }) = _Character;

  @override
  int get maxHp => vitality * 10;

  @override
  int get currentHp => maxHp;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
