import 'package:json_annotation/json_annotation.dart';
import 'package:mediquest_mobile/models/Institution.dart';

part 'Supervisor.g.dart';

@JsonSerializable(explicitToJson: true)
class Supervisor {
  int id;
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "staff_number")
  String staffNumber;
  Institution institution;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  Supervisor(this.id, this.userId, this.staffNumber, this.institution,
      this.createdAt, this.updatedAt);

  factory Supervisor.fromJson(Map<String, dynamic> json) =>
      Supervisor.fromJson(json);

  Map<String, dynamic> toJson() => _$SupervisorToJson(this);
}
