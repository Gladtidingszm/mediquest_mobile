import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:mediquest_mobile/models/Institution.dart';

part 'User.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  int id;
  String name;
  String email;
  String nrc;
  @JsonKey(name: "user_type")
  String userType;
  @JsonKey(name: "email_verified_at")
  DateTime emailVerifiesAt;
  String password;
  Institution institution;
  @JsonKey(name: "remember_token")
  String rememberToken;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  User(
      this.id,
      this.name,
      this.email,
      this.nrc,
      this.userType,
      this.emailVerifiesAt,
      this.password,
      this.institution,
      this.rememberToken,
      this.createdAt,
      this.updatedAt);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
