import 'Answer.dart';

class SubmissionRequestBody {
  List<Answer> answers;
  int submissionId;

  SubmissionRequestBody({this.answers, this.submissionId});

  SubmissionRequestBody.fromJson(Map<String, dynamic> json) {
    if (json['answers'] != null) {
      answers = new List<Answer>();
      json['answers'].forEach((v) {
        answers.add(new Answer.fromJson(v));
      });
    }
    submissionId = json['submission_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answers != null) {
      data['answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    data['submission_id'] = this.submissionId;
    return data;
  }

  @override
  String toString() {
    return 'SubmissionRequestBody{answers: $answers, submissionId: $submissionId}';
  }
}
