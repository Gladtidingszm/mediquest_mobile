import 'package:json_annotation/json_annotation.dart';
import 'package:mediquest_mobile/models/Assignment.dart';
import 'package:mediquest_mobile/models/Institution.dart';

part 'Questionnaire.g.dart';

@JsonSerializable(explicitToJson: true)
class Questionnaire {
  int id;
  Assignment assignment;
  String department;
  String mentor;
  @JsonKey(name: "interview_date")
  DateTime interviewDate;
  @JsonKey(name: "start_of_rotation")
  DateTime startOfRotation;
  Institution institution;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  Questionnaire(
      this.id,
      this.assignment,
      this.department,
      this.mentor,
      this.interviewDate,
      this.startOfRotation,
      this.institution,
      this.createdAt,
      this.updatedAt);

  factory Questionnaire.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnaireToJson(this);
}