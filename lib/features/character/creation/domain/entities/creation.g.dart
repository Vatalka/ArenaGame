// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Creation _$CreationFromJson(Map<String, dynamic> json) => _Creation(
  name: json['name'] as String? ?? '',
  remainingPoints: (json['remainingPoints'] as num?)?.toInt() ?? 5,
  vitality: (json['vitality'] as num?)?.toInt() ?? 3,
  strength: (json['strength'] as num?)?.toInt() ?? 3,
);

Map<String, dynamic> _$CreationToJson(_Creation instance) => <String, dynamic>{
  'name': instance.name,
  'remainingPoints': instance.remainingPoints,
  'vitality': instance.vitality,
  'strength': instance.strength,
};
