import 'package:json_annotation/json_annotation.dart';
import 'package:mediquest_mobile/models/Questionnaire.dart';

import 'Student.dart';

part 'StudentQuestionnaire.g.dart';

@JsonSerializable(explicitToJson: true)
class StudentQuestionnaire {
  int id;
  @JsonKey(name: "student")
  Student student;
  Questionnaire questionnaire;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  StudentQuestionnaire(this.id, this.student, this.questionnaire,
      this.createdAt, this.updatedAt);

  factory StudentQuestionnaire.fromJson(Map<String, dynamic> json) =>
      _$StudentQuestionnaireFromJson(json);

  Map<String, dynamic> toJson() => _$StudentQuestionnaireToJson(this);
}
