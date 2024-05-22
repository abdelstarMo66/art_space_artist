// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_event_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEventDetailsResponse _$GetEventDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetEventDetailsResponse(
      json['status'] as String,
      (json['code'] as num).toInt(),
      json['message'] as String,
      EventInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetEventDetailsResponseToJson(
        GetEventDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.eventInfo,
    };

EventInfo _$EventInfoFromJson(Map<String, dynamic> json) => EventInfo(
      json['id'] as String,
      json['title'] as String,
      json['description'] as String,
      json['imageId'] as String,
      json['coverImage'] as String,
      (json['duration'] as num).toInt(),
      json['began'] as String,
      json['end'] as String,
      (json['products'] as List<dynamic>)
          .map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventInfoToJson(EventInfo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageId': instance.imageId,
      'coverImage': instance.coverImage,
      'duration': instance.duration,
      'began': instance.began,
      'end': instance.end,
      'products': instance.products,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      json['id'] as String,
      json['title'] as String,
      json['price'] as num,
      json['coverImage'] as String,
      json['category'] as String,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'coverImage': instance.coverImage,
      'category': instance.category,
    };
