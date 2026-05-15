import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

@freezed
abstract class Character with _$Character {
  const Character._();

  const factory Character({
    required String id,
    required String name,
    required int currentHp,
    required int vitality,
    required int strength,
  }) = _Character;

  int get maxHp => vitality * 10;

  int get damage => strength;

  factory Character.createDefault() {
    const defaultValue = 10;
    return Character(
      id: '',
      name: '',
      currentHp: defaultValue * 10,
      vitality: defaultValue,
      strength: defaultValue,
    );
  }
}
