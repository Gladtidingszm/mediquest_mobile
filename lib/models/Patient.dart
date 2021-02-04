import 'package:json_annotation/json_annotation.dart';
import 'package:mediquest_mobile/models/Institution.dart';

import 'Questionnaire.dart';

part 'Patient.g.dart';

@JsonSerializable(explicitToJson: true)
class Patient {
  int id;
  Questionnaire questionnaire;
  String initials;
  DateTime dob;
  int age;
  String sex;
  Institution institution;

  Patient(this.id, this.questionnaire, this.initials, this.dob, this.age,
      this.sex, this.institution, this.createdAt, this.updatedAt);

  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
