import 'package:json_annotation/json_annotation.dart';

part 'ApiPayload.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiPayload {
  bool _success;
  String _message;

  bool get success => _success;

  set success(bool value) {
    _success = value;
  }

  ApiPayload(bool success, String message, dynamic payload) {
    this.message = message;
    this.payload = payload;
    this.success = success;
  }

  dynamic _payload;

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  dynamic get payload => _payload;

  set payload(dynamic value) {
    _payload = value;
  }

  factory ApiPayload.fromJson(Map<String, dynamic> json) =>
      _$ApiPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$ApiPayloadToJson(this);
}
