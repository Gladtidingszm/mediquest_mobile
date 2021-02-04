import 'package:json_annotation/json_annotation.dart';
import 'package:mediquest_mobile/models/Course.dart';
import 'package:mediquest_mobile/models/Institution.dart';
import 'package:mediquest_mobile/models/Supervisor.dart';

part 'CourseSupervision.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseSupervision {
  int id;

  CourseSupervision(this.id, this.course, this.institution, this.supervisor,
      this.createdAt, this.updatedAt);

  Course course;
  Institution institution;
  Supervisor supervisor;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  factory CourseSupervision.fromJson(Map<String, dynamic> json) =>
      _$CourseSupervisionFromJson(json);

  Map<String, dynamic> toJson() => _$CourseSupervisionToJson(this);
}
