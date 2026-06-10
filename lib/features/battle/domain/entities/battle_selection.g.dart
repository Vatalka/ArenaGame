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
      isBotMode: json['isBotMode'] as bool? ?? false,
      roundNumber: (json['roundNumber'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$BattleSelectionToJson(_BattleSelection instance) =>
    <String, dynamic>{
      'selectedAttack': _$AreaEnumMap[instance.selectedAttack],
      'selectedBlock': _$AreaEnumMap[instance.selectedBlock],
      'isBotMode': instance.isBotMode,
      'roundNumber': instance.roundNumber,
    };

const _$AreaEnumMap = {Area.head: 'head', Area.body: 'body', Area.legs: 'legs'};
