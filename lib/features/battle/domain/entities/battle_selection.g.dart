// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BattleSelectionImpl _$$BattleSelectionImplFromJson(
        Map<String, dynamic> json) =>
    _$BattleSelectionImpl(
      selectedAttack:
          $enumDecodeNullable(_$AreaEnumMap, json['selectedAttack']),
      selectedBlock: $enumDecodeNullable(_$AreaEnumMap, json['selectedBlock']),
    );

Map<String, dynamic> _$$BattleSelectionImplToJson(
        _$BattleSelectionImpl instance) =>
    <String, dynamic>{
      'selectedAttack': _$AreaEnumMap[instance.selectedAttack],
      'selectedBlock': _$AreaEnumMap[instance.selectedBlock],
    };

const _$AreaEnumMap = {
  Area.head: 'head',
  Area.body: 'body',
  Area.legs: 'legs',
};
