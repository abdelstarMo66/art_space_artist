// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEventRequestBody _$CreateEventRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateEventRequestBody(
      title: json['title'] as String,
      description: json['description'] as String,
      duration: (json['duration'] as num).toInt(),
      began: json['began'] as String,
    );

Map<String, dynamic> _$CreateEventRequestBodyToJson(
        CreateEventRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'duration': instance.duration,
      'began': instance.began,
    };
