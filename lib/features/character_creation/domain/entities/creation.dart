import 'package:arena_game/features/character_creation/domain/entities/stat_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'creation.freezed.dart';

part 'creation.g.dart';

@freezed
abstract class Creation with _$Creation {
  static const int initialStatValue = 3;

  const factory Creation({
    @Default('') String name,
    @Default(Creation.initialStatValue) int remainingPoints,
    @Default(Creation.initialStatValue) int vitality,
    @Default(Creation.initialStatValue) int strength,
  }) = _Creation;

  const Creation._();

  int getValueFor(StatType type) {
    return switch (type) {
      StatType.vitality => vitality,
      StatType.strength => strength,
    };
  }

  bool canIncrement(StatType type) {
    return remainingPoints > 0;
  }

  bool canDecrement(StatType type) {
    return getValueFor(type) > Creation.initialStatValue;
  }

  bool get isValid => name.trim().length >= 3;

  String? get nameError {
    if (name.isEmpty) return null;
    if (name.trim().length < 3) return 'Name is too short';
    return null;
  }

  factory Creation.fromJson(Map<String, dynamic> json) =>
      _$CreationFromJson(json);
}
