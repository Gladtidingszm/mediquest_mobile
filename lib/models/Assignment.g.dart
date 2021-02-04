// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Assignment _$AssignmentFromJson(Map<String, dynamic> json) {
  return Assignment(
    json['id'] as int,
    json['assignment_number'] as String,
    json['description'] as String,
    json['date_issued'] == null
        ? null
        : DateTime.parse(json['date_issued'] as String),
    json['due_date'] == null
        ? null
        : DateTime.parse(json['due_date'] as String),
    json['staff'] == null
        ? null
        : Supervisor.fromJson(json['staff'] as Map<String, dynamic>),
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

Map<String, dynamic> _$AssignmentToJson(Assignment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assignment_number': instance.assignmentNumber,
      'description': instance.description,
      'date_issued': instance.dateIssued?.toIso8601String(),
      'due_date': instance.dueDate?.toIso8601String(),
      'staff': instance.staff?.toJson(),
      'institution': instance.institution?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
