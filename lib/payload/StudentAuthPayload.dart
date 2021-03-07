import 'package:mediquest_mobile/models/Student.dart';

class StudentAuthPayload {
  Student student;
  String accessToken;

  StudentAuthPayload({this.student, this.accessToken});

  StudentAuthPayload.fromJson(Map<String, dynamic> json) {
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.student != null) {
      data['student'] = this.student.toJson();
    }
    data['access_token'] = this.accessToken;
    return data;
  }
}
