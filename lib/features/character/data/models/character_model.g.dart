// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    _CharacterModel(
      id: json['id'] as String,
      name: json['name'] as String,
      currentHp: (json['currentHp'] as num).toInt(),
      vitality: (json['vitality'] as num).toInt(),
      strength: (json['strength'] as num).toInt(),
    );

Map<String, dynamic> _$CharacterModelToJson(_CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currentHp': instance.currentHp,
      'vitality': instance.vitality,
      'strength': instance.strength,
    };
