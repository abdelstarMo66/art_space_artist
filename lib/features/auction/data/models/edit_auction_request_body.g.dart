// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_auction_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditAuctionRequestBody _$EditAuctionRequestBodyFromJson(
        Map<String, dynamic> json) =>
    EditAuctionRequestBody(
      title: json['title'] as String,
      description: json['description'] as String,
      material: json['material'] as String,
      price: json['price'] as String,
      duration: (json['duration'] as num).toInt(),
      began: json['began'] as String,
    );

Map<String, dynamic> _$EditAuctionRequestBodyToJson(
        EditAuctionRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'material': instance.material,
      'price': instance.price,
      'duration': instance.duration,
      'began': instance.began,
    };
