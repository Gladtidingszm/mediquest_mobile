import 'package:json_annotation/json_annotation.dart';
import 'package:mediquest_mobile/models/Institution.dart';

import 'User.dart';

part 'Student.g.dart';

@JsonSerializable(explicitToJson: true)
class Student {
  int id;
  @JsonKey(name: "user")
  User user;
  @JsonKey(name: "computer_number")
  String computerNumber;
  Institution institution;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  Student(this.id, this.user, this.computerNumber, this.institution,
      this.createdAt, this.updatedAt);

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
