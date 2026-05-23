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
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: '',
      currentHp: defaultValue * 10,
      vitality: defaultValue,
      strength: defaultValue,
    );
  }

  bool get nameIsValid => name.trim().length >= 3;

  String? get nameError {
    if (name.isEmpty) return null;
    if (name.trim().length < 3) return 'Name is too short';
    return null;
  }
}
