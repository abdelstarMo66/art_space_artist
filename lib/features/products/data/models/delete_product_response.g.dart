// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteProductResponse _$DeleteProductResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteProductResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$DeleteProductResponseToJson(
        DeleteProductResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
    };
