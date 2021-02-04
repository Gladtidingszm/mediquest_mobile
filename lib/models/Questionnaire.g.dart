// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Questionnaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questionnaire _$QuestionnaireFromJson(Map<String, dynamic> json) {
  return Questionnaire(
    json['id'] as int,
    json['assignment'] == null
        ? null
        : Assignment.fromJson(json['assignment'] as Map<String, dynamic>),
    json['department'] as String,
    json['mentor'] as String,
    json['interview_date'] == null
        ? null
        : DateTime.parse(json['interview_date'] as String),
    json['start_of_rotation'] == null
        ? null
        : DateTime.parse(json['start_of_rotation'] as String),
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

Map<String, dynamic> _$QuestionnaireToJson(Questionnaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assignment': instance.assignment?.toJson(),
      'department': instance.department,
      'mentor': instance.mentor,
      'interview_date': instance.interviewDate?.toIso8601String(),
      'start_of_rotation': instance.startOfRotation?.toIso8601String(),
      'institution': instance.institution?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
