import 'package:json_annotation/json_annotation.dart';
import 'package:mediquest_mobile/models/Institution.dart';
import 'package:mediquest_mobile/models/Patient.dart';
import 'package:mediquest_mobile/models/Questionnaire.dart';
import 'package:mediquest_mobile/models/Student.dart';

part 'Submission.g.dart';

@JsonSerializable(explicitToJson: true)
class Submission {
  int id;

  Questionnaire questionnaire;

  Student student;
  Patient patient;

  String status;
  String comment;
  Institution institution;

  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  Submission(
      this.id,
      this.questionnaire,
      this.student,
      this.patient,
      this.status,
      this.comment,
      this.institution,
      this.createdAt,
      this.updatedAt);

  factory Submission.fromJson(Map<String, dynamic> json) =>
      _$SubmissionFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionToJson(this);
}
