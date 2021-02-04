import 'package:json_annotation/json_annotation.dart';

part 'Institution.g.dart';

@JsonSerializable(explicitToJson: true)
class Institution {
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  String logo;
  String name;

  Institution(this.createdAt, this.updatedAt, this.logo, this.name);

  factory Institution.fromJson(Map<String, dynamic> json) =>
      _$InstitutionFromJson(json);

  Map<String, dynamic> toJson() => _$InstitutionToJson(this);

}