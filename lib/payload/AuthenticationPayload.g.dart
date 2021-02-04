// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthenticationPayload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationPayload _$AuthenticationPayloadFromJson(
    Map<String, dynamic> json) {
  return AuthenticationPayload(
    json['student'] == null
        ? null
        : Student.fromJson(json['student'] as Map<String, dynamic>),
    json['accessToken'] as String,
  );
}

Map<String, dynamic> _$AuthenticationPayloadToJson(
        AuthenticationPayload instance) =>
    <String, dynamic>{
      'student': instance.student?.toJson(),
      'accessToken': instance.accessToken,
    };
