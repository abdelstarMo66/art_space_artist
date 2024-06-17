// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProductResponse _$EditProductResponseFromJson(Map<String, dynamic> json) =>
    EditProductResponse(
      status: json['status'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$EditProductResponseToJson(
        EditProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
