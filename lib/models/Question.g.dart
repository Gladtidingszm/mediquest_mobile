// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    json['id'] as int,
    json['questionText'] as String,
    json['options'] as String,
    json['is_option_text'] as bool,
    json['is_multiple_selection'] as bool,
    json['selection_limit'] as int,
    json['answer_data_type'] as String,
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

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'questionText': instance.questionText,
      'options': instance.options,
      'is_option_text': instance.isOpenText,
      'is_multiple_selection': instance.isMultipleSelection,
      'selection_limit': instance.selectionLimit,
      'answer_data_type': instance.dataType,
      'institution': instance.institution?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
