import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_log_item.freezed.dart';

part 'battle_log_item.g.dart';

enum LogType { info, attack, block, damage }

@freezed
abstract class BattleLogItem with _$BattleLogItem {
  const factory BattleLogItem({
    required String id,
    required DateTime timestamp,
    required String message,
    required LogType type,
  }) = _BattleLogItem;

  factory BattleLogItem.fromJson(Map<String, dynamic> json) =>
      _$BattleLogItemFromJson(json);
}
