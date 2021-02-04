import 'package:json_annotation/json_annotation.dart';
import 'package:mediquest_mobile/models/Student.dart';

part 'AuthenticationPayload.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthenticationPayload {
  Student student;
  String accessToken;

  AuthenticationPayload(this.student, this.accessToken);

  factory AuthenticationPayload.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationPayloadToJson(this);
}
