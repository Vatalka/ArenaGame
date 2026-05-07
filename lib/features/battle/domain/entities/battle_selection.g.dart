// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BattleSelection _$BattleSelectionFromJson(Map<String, dynamic> json) =>
    _BattleSelection(
      selectedAttack: $enumDecodeNullable(
        _$AreaEnumMap,
        json['selectedAttack'],
      ),
      selectedBlock: $enumDecodeNullable(_$AreaEnumMap, json['selectedBlock']),
    );

Map<String, dynamic> _$BattleSelectionToJson(_BattleSelection instance) =>
    <String, dynamic>{
      'selectedAttack': _$AreaEnumMap[instance.selectedAttack],
      'selectedBlock': _$AreaEnumMap[instance.selectedBlock],
    };

const _$AreaEnumMap = {Area.head: 'head', Area.body: 'body', Area.legs: 'legs'};
