// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductResponse _$AddProductResponseFromJson(Map<String, dynamic> json) =>
    AddProductResponse(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      status: json['status'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddProductResponseToJson(AddProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
    };
