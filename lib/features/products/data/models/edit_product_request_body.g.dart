// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_product_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProductRequestBody _$EditProductRequestBodyFromJson(
        Map<String, dynamic> json) =>
    EditProductRequestBody(
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      depth: json['depth'] as String?,
    );

Map<String, dynamic> _$EditProductRequestBodyToJson(
        EditProductRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'height': instance.height,
      'weight': instance.weight,
      'depth': instance.depth,
    };
