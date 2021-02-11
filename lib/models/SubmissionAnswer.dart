import 'Question.dart';

class SubmissionAnswer {
  int submissionId;
  String response;
  String updatedAt;
  String createdAt;
  int id;
  Question question;

  SubmissionAnswer(
      {this.submissionId,
      this.response,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.question});

  SubmissionAnswer.fromJson(Map<String, dynamic> json) {
    submissionId = json['submission_id'];
    response = json['response'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    question = json['question'] != null
        ? new Question.fromJson(json['question'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['submission_id'] = this.submissionId;
    data['response'] = this.response;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    if (this.question != null) {
      data['question'] = this.question.toJson();
    }
    return data;
  }
}

