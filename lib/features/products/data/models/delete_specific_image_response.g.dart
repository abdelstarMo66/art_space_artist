// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_specific_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteSpecificImageResponse _$DeleteSpecificImageResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteSpecificImageResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$DeleteSpecificImageResponseToJson(
        DeleteSpecificImageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
    };
