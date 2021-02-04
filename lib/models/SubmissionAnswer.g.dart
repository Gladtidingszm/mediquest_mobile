// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubmissionAnswer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmissionAnswer _$SubmissionAnswerFromJson(Map<String, dynamic> json) {
  return SubmissionAnswer(
    json['response'] as String,
    json['question'] == null
        ? null
        : Question.fromJson(json['question'] as Map<String, dynamic>),
    json['submission'] == null
        ? null
        : Submission.fromJson(json['submission'] as Map<String, dynamic>),
    json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$SubmissionAnswerToJson(SubmissionAnswer instance) =>
    <String, dynamic>{
      'response': instance.response,
      'question': instance.question?.toJson(),
      'submission': instance.submission?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
