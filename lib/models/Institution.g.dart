// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Institution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Institution _$InstitutionFromJson(Map<String, dynamic> json) {
  return Institution(
    json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    json['logo'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$InstitutionToJson(Institution instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'logo': instance.logo,
      'name': instance.name,
    };
