import 'package:arena_game/features/character/creation/domain/entities/stat_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'creation.freezed.dart';

part 'creation.g.dart';

@freezed
abstract class Creation with _$Creation {
  const factory Creation({
    @Default('') String name,
    @Default(5) int remainingPoints,
    @Default(3) int vitality,
    @Default(3) int strength,
  }) = _Creation;

  const Creation._();

  int getValueFor(StatType type) {
    return switch (type) {
      StatType.vitality => vitality,
      StatType.strength => strength,
    };
  }

  bool get isValid => name.trim().length >= 3 && remainingPoints == 0;

  String? get nameError {
    if (name.isEmpty) return null;
    if (name.trim().length < 3) return 'Name is too short';
    return null;
  }

  factory Creation.fromJson(Map<String, dynamic> json) =>
      _$CreationFromJson(json);
}
