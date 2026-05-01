// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BattleStateImpl _$$BattleStateImplFromJson(Map<String, dynamic> json) =>
    _$BattleStateImpl(
      selectedAttack:
          $enumDecodeNullable(_$AreaEnumMap, json['selectedAttack']),
      selectedBlock: $enumDecodeNullable(_$AreaEnumMap, json['selectedBlock']),
    );

Map<String, dynamic> _$$BattleStateImplToJson(_$BattleStateImpl instance) =>
    <String, dynamic>{
      'selectedAttack': _$AreaEnumMap[instance.selectedAttack],
      'selectedBlock': _$AreaEnumMap[instance.selectedBlock],
    };

const _$AreaEnumMap = {
  Area.head: 'head',
  Area.body: 'body',
  Area.legs: 'legs',
};
