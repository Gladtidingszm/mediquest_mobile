// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiPayload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPayload _$ApiPayloadFromJson(Map<String, dynamic> json) {
  return ApiPayload(
    json['success'] as bool,
    json['message'] as String,
    json['payload'],
  );
}

Map<String, dynamic> _$ApiPayloadToJson(ApiPayload instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'payload': instance.payload,
    };
