import 'package:arena_game/features/game/battle/domain/entities/battle_selection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_log_item.freezed.dart';

part 'battle_log_item.g.dart';

enum BattleResult { draw, playerWin, botWin }

@freezed
abstract class BattleLogItem with _$BattleLogItem {
  const factory BattleLogItem.info({
    required String id,
    required DateTime timestamp,
    required String message,
  }) = _InfoLog;

  const factory BattleLogItem.attack({
    required String id,
    required DateTime timestamp,
    required String attackerName,
    required Area area,
    required int damage,
  }) = _AttackLog;

  const factory BattleLogItem.block({
    required String id,
    required DateTime timestamp,
    required String defenderName,
    required Area area,
  }) = _BlockLog;

  const factory BattleLogItem.gameOver({
    required String id,
    required DateTime timestamp,
    required BattleResult result,
    required String winnerName,
  }) = _GameOverLog;

  factory BattleLogItem.fromJson(Map<String, dynamic> json) =>
      _$BattleLogItemFromJson(json);
}
