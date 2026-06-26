// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_log_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoLog _$InfoLogFromJson(Map<String, dynamic> json) => _InfoLog(
  id: json['id'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  message: json['message'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$InfoLogToJson(_InfoLog instance) => <String, dynamic>{
  'id': instance.id,
  'timestamp': instance.timestamp.toIso8601String(),
  'message': instance.message,
  'runtimeType': instance.$type,
};

_AttackLog _$AttackLogFromJson(Map<String, dynamic> json) => _AttackLog(
  id: json['id'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  attackerName: json['attackerName'] as String,
  area: $enumDecode(_$AreaEnumMap, json['area']),
  damage: (json['damage'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$AttackLogToJson(_AttackLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'attackerName': instance.attackerName,
      'area': _$AreaEnumMap[instance.area]!,
      'damage': instance.damage,
      'runtimeType': instance.$type,
    };

const _$AreaEnumMap = {Area.head: 'head', Area.body: 'body', Area.legs: 'legs'};

_BlockLog _$BlockLogFromJson(Map<String, dynamic> json) => _BlockLog(
  id: json['id'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  defenderName: json['defenderName'] as String,
  area: $enumDecode(_$AreaEnumMap, json['area']),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$BlockLogToJson(_BlockLog instance) => <String, dynamic>{
  'id': instance.id,
  'timestamp': instance.timestamp.toIso8601String(),
  'defenderName': instance.defenderName,
  'area': _$AreaEnumMap[instance.area]!,
  'runtimeType': instance.$type,
};

_StartBattleLog _$StartBattleLogFromJson(Map<String, dynamic> json) =>
    _StartBattleLog(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      playerName: json['playerName'] as String,
      botName: json['botName'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$StartBattleLogToJson(_StartBattleLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'playerName': instance.playerName,
      'botName': instance.botName,
      'runtimeType': instance.$type,
    };

_EndBattleLog _$EndBattleLogFromJson(Map<String, dynamic> json) =>
    _EndBattleLog(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      result: $enumDecode(_$BattleResultEnumMap, json['result']),
      winnerName: json['winnerName'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EndBattleLogToJson(_EndBattleLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'result': _$BattleResultEnumMap[instance.result]!,
      'winnerName': instance.winnerName,
      'runtimeType': instance.$type,
    };

const _$BattleResultEnumMap = {
  BattleResult.draw: 'draw',
  BattleResult.playerWin: 'playerWin',
  BattleResult.botWin: 'botWin',
};

_RoundLog _$RoundLogFromJson(Map<String, dynamic> json) => _RoundLog(
  id: json['id'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  roundNumber: (json['roundNumber'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$RoundLogToJson(_RoundLog instance) => <String, dynamic>{
  'id': instance.id,
  'timestamp': instance.timestamp.toIso8601String(),
  'roundNumber': instance.roundNumber,
  'runtimeType': instance.$type,
};
