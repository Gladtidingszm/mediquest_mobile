// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return Patient(
    json['id'] as int,
    json['questionnaire'] == null
        ? null
        : Questionnaire.fromJson(json['questionnaire'] as Map<String, dynamic>),
    json['initials'] as String,
    json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
    json['age'] as int,
    json['sex'] as String,
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

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'id': instance.id,
      'questionnaire': instance.questionnaire?.toJson(),
      'initials': instance.initials,
      'dob': instance.dob?.toIso8601String(),
      'age': instance.age,
      'sex': instance.sex,
      'institution': instance.institution?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
