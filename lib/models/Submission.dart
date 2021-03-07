import 'Patient.dart';
import 'Questionnaire.dart';
import 'Student.dart';

class Submission {
  int id;
  String status;
  String comment;
  int institutionId;
  String createdAt;
  String updatedAt;
  Student student;
  Questionnaire questionnaire;
  Patient patient;

  Submission(
      {this.id,
      this.status,
      this.comment,
      this.institutionId,
      this.createdAt,
      this.updatedAt,
      this.student,
      this.questionnaire,
      this.patient});

  Submission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    comment = json['comment'];
    institutionId = json['institution_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
    questionnaire = json['questionnaire'] != null
        ? new Questionnaire.fromJson(json['questionnaire'])
        : null;
    patient =
        json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['comment'] = this.comment;
    data['institution_id'] = this.institutionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.student != null) {
      data['student'] = this.student.toJson();
    }
    if (this.questionnaire != null) {
      data['questionnaire'] = this.questionnaire.toJson();
    }
    if (this.patient != null) {
      data['patient'] = this.patient.toJson();
    }
    return data;
  }
}
