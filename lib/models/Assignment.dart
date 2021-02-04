import 'package:json_annotation/json_annotation.dart';
import 'package:mediquest_mobile/models/Institution.dart';

import 'Supervisor.dart';

part 'Assignment.g.dart';

@JsonSerializable(explicitToJson: true)
class Assignment {
  int id;
  @JsonKey(name: "assignment_number")
  String assignmentNumber;
  String description;
  @JsonKey(name: "date_issued")
  DateTime dateIssued;
  @JsonKey(name: "due_date")
  DateTime dueDate;
  Supervisor staff;
  Institution institution;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  Assignment(
      this.id,
      this.assignmentNumber,
      this.description,
      this.dateIssued,
      this.dueDate,
      this.staff,
      this.institution,
      this.createdAt,
      this.updatedAt);

  factory Assignment.fromJson(Map<String, dynamic> json) =>
      Assignment.fromJson(json);

  Map<String, dynamic> toJson() => _$AssignmentToJson(this);
}
