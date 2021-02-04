import 'package:json_annotation/json_annotation.dart';

import 'Question.dart';
import 'Submission.dart';

part 'SubmissionAnswer.g.dart';

@JsonSerializable(explicitToJson: true)
class SubmissionAnswer {
  String response;
  Question question;
  Submission submission;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  SubmissionAnswer(this.response, this.question, this.submission,
      this.createdAt, this.updatedAt);

  factory SubmissionAnswer.fromJson(Map<String, dynamic> json) =>
      _$SubmissionAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionAnswerToJson(this);
}
