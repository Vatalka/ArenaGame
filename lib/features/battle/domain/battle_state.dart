import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_state.freezed.dart';

part 'battle_state.g.dart';

enum BattleZone {
  head,
  body,
  legs,
}

@freezed
class BattleState with _$BattleState {
  const factory BattleState({
    required Character player,
    required Character enemy,
    BattleZone? playerAttackZone,
    BattleZone? playerBlockZone,
    BattleZone? enemyAttackZone,
    BattleZone? enemyBlockZone,
    required List<String> battleLog,
  }) = _BattleState;

  factory BattleState.fromJson(Map<String, dynamic> json) =>
      _$BattleStateFromJson(json);
}
