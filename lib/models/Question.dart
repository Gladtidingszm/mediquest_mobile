class Question {
  int id;
  String questionText;
  String options;
  bool isOpenText;
  bool isMultipleSelection;
  int selectionLimit;
  String answerDatatype;
  int institutionId;
  String createdAt;
  String updatedAt;

  Question(
      {this.id,
      this.questionText,
      this.options,
      this.isOpenText,
      this.isMultipleSelection,
      this.selectionLimit,
      this.answerDatatype,
      this.institutionId,
      this.createdAt,
      this.updatedAt});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionText = json['question_text'];
    options = json['options'];
    isOpenText = json['is_open_text'];
    isMultipleSelection = json['is_multiple_selection'];
    selectionLimit = json['selection_limit'];
    answerDatatype = json['answer_datatype'];
    institutionId = json['institution_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_text'] = this.questionText;
    data['options'] = this.options;
    data['is_open_text'] = this.isOpenText;
    data['is_multiple_selection'] = this.isMultipleSelection;
    data['selection_limit'] = this.selectionLimit;
    data['answer_datatype'] = this.answerDatatype;
    data['institution_id'] = this.institutionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}