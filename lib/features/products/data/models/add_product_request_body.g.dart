// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductRequestBody _$AddProductRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddProductRequestBody(
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      subject: json['subject'] as String,
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
      material: json['material'] as String,
      style: json['style'] as String,
    );

Map<String, dynamic> _$AddProductRequestBodyToJson(
        AddProductRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'category': instance.category,
      'subject': instance.subject,
      'style': instance.style,
      'height': instance.height,
      'width': instance.width,
      'depth': instance.depth,
      'material': instance.material,
    };
