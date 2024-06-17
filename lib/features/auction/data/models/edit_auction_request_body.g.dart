// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_auction_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditAuctionRequestBody _$EditAuctionRequestBodyFromJson(
        Map<String, dynamic> json) =>
    EditAuctionRequestBody(
      title: json['title'] as String?,
      description: json['description'] as String?,
      material: json['material'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      depth: json['depth'] as String?,
      began: json['began'] as String?,
    );

Map<String, dynamic> _$EditAuctionRequestBodyToJson(
        EditAuctionRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'material': instance.material,
      'height': instance.height,
      'weight': instance.weight,
      'depth': instance.depth,
      'began': instance.began,
    };
