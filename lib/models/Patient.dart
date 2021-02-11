import 'Submission.dart';

class Patient {
  int id;
  int questionnaireId;
  String initials;
  int age;
  String sex;
  String dob;
  int institutionId;
  String createdAt;
  String updatedAt;
  Submission submission;

  Patient(
      {this.id,
      this.questionnaireId,
      this.initials,
      this.age,
      this.sex,
      this.dob,
      this.institutionId,
      this.createdAt,
      this.updatedAt,
      this.submission});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionnaireId = json['questionnaire_id'];
    initials = json['initials'];
    age = json['age'];
    sex = json['sex'];
    dob = json['dob'];
    institutionId = json['institution_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    submission = json['submission'] != null
        ? new Submission.fromJson(json['submission'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questionnaire_id'] = this.questionnaireId;
    data['initials'] = this.initials;
    data['age'] = this.age;
    data['sex'] = this.sex;
    data['dob'] = this.dob;
    data['institution_id'] = this.institutionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.submission != null) {
      data['submission'] = this.submission.toJson();
    }
    return data;
  }
}

