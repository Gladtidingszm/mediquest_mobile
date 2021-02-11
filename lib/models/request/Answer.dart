class Answer {
  String response;
  int questionId;

  Answer({this.response, this.questionId});

  Answer.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    questionId = json['question_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['question_id'] = this.questionId;
    return data;
  }

  @override
  String toString() {
    return 'Answer{response: $response, questionId: $questionId}';
  }
}
