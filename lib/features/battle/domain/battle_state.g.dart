// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BattleStateImpl _$$BattleStateImplFromJson(Map<String, dynamic> json) =>
    _$BattleStateImpl(
      player: Character.fromJson(json['player'] as Map<String, dynamic>),
      enemy: Character.fromJson(json['enemy'] as Map<String, dynamic>),
      playerAttackZone:
          $enumDecodeNullable(_$BattleZoneEnumMap, json['playerAttackZone']),
      playerBlockZone:
          $enumDecodeNullable(_$BattleZoneEnumMap, json['playerBlockZone']),
      enemyAttackZone:
          $enumDecodeNullable(_$BattleZoneEnumMap, json['enemyAttackZone']),
      enemyBlockZone:
          $enumDecodeNullable(_$BattleZoneEnumMap, json['enemyBlockZone']),
      battleLog:
          (json['battleLog'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$BattleStateImplToJson(_$BattleStateImpl instance) =>
    <String, dynamic>{
      'player': instance.player,
      'enemy': instance.enemy,
      'playerAttackZone': _$BattleZoneEnumMap[instance.playerAttackZone],
      'playerBlockZone': _$BattleZoneEnumMap[instance.playerBlockZone],
      'enemyAttackZone': _$BattleZoneEnumMap[instance.enemyAttackZone],
      'enemyBlockZone': _$BattleZoneEnumMap[instance.enemyBlockZone],
      'battleLog': instance.battleLog,
    };

const _$BattleZoneEnumMap = {
  BattleZone.head: 'head',
  BattleZone.body: 'body',
  BattleZone.legs: 'legs',
};
