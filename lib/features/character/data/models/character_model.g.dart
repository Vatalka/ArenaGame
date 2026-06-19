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
      lastUpdateTime: (json['lastUpdateTime'] as num?)?.toInt() ?? 0,
      level: (json['level'] as num?)?.toInt() ?? 0,
      experience: (json['experience'] as num?)?.toInt() ?? 0,
      statPoints: (json['statPoints'] as num?)?.toInt() ?? 0,
      isInCombat: json['isInCombat'] as bool? ?? false,
    );

Map<String, dynamic> _$CharacterModelToJson(_CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currentHp': instance.currentHp,
      'vitality': instance.vitality,
      'strength': instance.strength,
      'lastUpdateTime': instance.lastUpdateTime,
      'level': instance.level,
      'experience': instance.experience,
      'statPoints': instance.statPoints,
      'isInCombat': instance.isInCombat,
    };
