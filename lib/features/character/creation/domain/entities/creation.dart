import 'package:freezed_annotation/freezed_annotation.dart';

part 'creation.freezed.dart';

part 'creation.g.dart';

@freezed
abstract class CreationState with _$CreationState {
  const factory CreationState({
    @Default('') String name,
    @Default(5) int remainingPoints,
    @Default(3) int vitality,
    @Default(3) int strength,
  }) = _CreationState;

  const CreationState._();
  bool get isValid => name.trim().length >= 3 && remainingPoints == 0;

  String? get nameError {
    if (name.isEmpty) return null;
    if (name.trim().length < 3) return 'Name is too short';
    return null;
  }

  factory CreationState.fromJson(Map<String, dynamic> json) =>
      _$CreationStateFromJson(json);
}
