// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_to_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductToEventResponse _$AddProductToEventResponseFromJson(
        Map<String, dynamic> json) =>
    AddProductToEventResponse(
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$AddProductToEventResponseToJson(
        AddProductToEventResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
