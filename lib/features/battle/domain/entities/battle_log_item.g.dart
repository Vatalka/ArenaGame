// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_log_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BattleLogItem _$BattleLogItemFromJson(Map<String, dynamic> json) =>
    _BattleLogItem(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      message: json['message'] as String,
      type: $enumDecode(_$LogTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$BattleLogItemToJson(_BattleLogItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'message': instance.message,
      'type': _$LogTypeEnumMap[instance.type]!,
    };

const _$LogTypeEnumMap = {
  LogType.info: 'info',
  LogType.attack: 'attack',
  LogType.block: 'block',
  LogType.damage: 'damage',
};
