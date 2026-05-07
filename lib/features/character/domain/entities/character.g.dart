// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Character _$CharacterFromJson(Map<String, dynamic> json) => _Character(
  name: json['name'] as String,
  currentHp: (json['currentHp'] as num).toInt(),
  vitality: (json['vitality'] as num).toInt(),
  strength: (json['strength'] as num).toInt(),
  precision: (json['precision'] as num).toInt(),
  agility: (json['agility'] as num).toInt(),
);

Map<String, dynamic> _$CharacterToJson(_Character instance) =>
    <String, dynamic>{
      'name': instance.name,
      'currentHp': instance.currentHp,
      'vitality': instance.vitality,
      'strength': instance.strength,
      'precision': instance.precision,
      'agility': instance.agility,
    };
