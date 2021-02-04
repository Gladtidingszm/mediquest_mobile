// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Supervisor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Supervisor _$SupervisorFromJson(Map<String, dynamic> json) {
  return Supervisor(
    json['id'] as int,
    json['user_id'] as int,
    json['staff_number'] as String,
    json['institution'] == null
        ? null
        : Institution.fromJson(json['institution'] as Map<String, dynamic>),
    json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$SupervisorToJson(Supervisor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'staff_number': instance.staffNumber,
      'institution': instance.institution?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
