// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Submission _$SubmissionFromJson(Map<String, dynamic> json) {
  return Submission(
    json['id'] as int,
    json['questionnaire'] == null
        ? null
        : Questionnaire.fromJson(json['questionnaire'] as Map<String, dynamic>),
    json['student'] == null
        ? null
        : Student.fromJson(json['student'] as Map<String, dynamic>),
    json['patient'] == null
        ? null
        : Patient.fromJson(json['patient'] as Map<String, dynamic>),
    json['status'] as String,
    json['comment'] as String,
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

Map<String, dynamic> _$SubmissionToJson(Submission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionnaire': instance.questionnaire?.toJson(),
      'student': instance.student?.toJson(),
      'patient': instance.patient?.toJson(),
      'status': instance.status,
      'comment': instance.comment,
      'institution': instance.institution?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
