// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseSupervision.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseSupervision _$CourseSupervisionFromJson(Map<String, dynamic> json) {
  return CourseSupervision(
    json['id'] as int,
    json['course'] == null
        ? null
        : Course.fromJson(json['course'] as Map<String, dynamic>),
    json['institution'] == null
        ? null
        : Institution.fromJson(json['institution'] as Map<String, dynamic>),
    json['supervisor'] == null
        ? null
        : Supervisor.fromJson(json['supervisor'] as Map<String, dynamic>),
    json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$CourseSupervisionToJson(CourseSupervision instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course': instance.course?.toJson(),
      'institution': instance.institution?.toJson(),
      'supervisor': instance.supervisor?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
