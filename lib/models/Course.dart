import 'package:json_annotation/json_annotation.dart';
import 'package:mediquest_mobile/models/Institution.dart';

part 'Course.g.dart';

@JsonSerializable(explicitToJson: true)
class Course {
  @JsonKey(name: "course_code")
  String courseCode;
  @JsonKey(name: "course_name")
  String courseName;
  Institution institution;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  int id;

  Course(this.id, this.courseCode, this.courseName, this.institution,
      this.createdAt, this.updatedAt);

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
