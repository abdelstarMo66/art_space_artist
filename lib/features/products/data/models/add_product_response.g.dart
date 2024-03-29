// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductResponse _$AddProductResponseFromJson(Map<String, dynamic> json) =>
    AddProductResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AddProductResponseToJson(AddProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
