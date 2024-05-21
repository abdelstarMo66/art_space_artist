// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEventResponse _$CreateEventResponseFromJson(Map<String, dynamic> json) =>
    CreateEventResponse(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CreateEventResponseToJson(
        CreateEventResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
