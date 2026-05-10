import 'package:freezed_annotation/freezed_annotation.dart';

part 'creation_state.freezed.dart';

part 'creation_state.g.dart';

@freezed
abstract class CreationState with _$CreationState {
  const factory CreationState({
    @Default('') String name,
    @Default(5) int remainingPoints,
    @Default(3) int vitality,
    @Default(3) int strength,
  }) = _CreationState;

  factory CreationState.fromJson(Map<String, dynamic> json) =>
      _$CreationStateFromJson(json);
}
