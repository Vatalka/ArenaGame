import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_state.freezed.dart';

part 'battle_state.g.dart';

enum Area { head, body, legs }

@freezed
class BattleState with _$BattleState {
  const factory BattleState({
    Area? selectedAttack,
    Area? selectedBlock,
  }) = _BattleState;

  factory BattleState.fromJson(Map<String, dynamic> json) =>
      _$BattleStateFromJson(json);
}
