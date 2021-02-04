// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StudentQuestionnaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentQuestionnaire _$StudentQuestionnaireFromJson(Map<String, dynamic> json) {
  return StudentQuestionnaire(
    json['id'] as int,
    json['student'] == null
        ? null
        : Student.fromJson(json['student'] as Map<String, dynamic>),
    json['questionnaire'] == null
        ? null
        : Questionnaire.fromJson(json['questionnaire'] as Map<String, dynamic>),
    json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$StudentQuestionnaireToJson(
        StudentQuestionnaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student': instance.student?.toJson(),
      'questionnaire': instance.questionnaire?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
