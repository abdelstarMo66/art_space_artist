// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_auction_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAuctionDetailsResponse _$GetAuctionDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAuctionDetailsResponse(
      json['status'] as String,
      (json['code'] as num).toInt(),
      json['message'] as String,
      AuctionInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAuctionDetailsResponseToJson(
        GetAuctionDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.auctionInfo,
    };

AuctionInfo _$AuctionInfoFromJson(Map<String, dynamic> json) => AuctionInfo(
      json['id'] as String,
      json['title'] as String,
      json['description'] as String,
      (json['price'] as num).toInt(),
      (json['duration'] as num).toInt(),
      json['began'] as String,
      Images.fromJson(json['coverImage'] as Map<String, dynamic>),
      (json['images'] as List<dynamic>)
          .map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['material'] as String,
      json['subject'] as String,
      json['category'] as String,
      json['end'] as String,
      json['style'] as String,
    );

Map<String, dynamic> _$AuctionInfoToJson(AuctionInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'duration': instance.duration,
      'began': instance.began,
      'end': instance.end,
      'coverImage': instance.coverImage,
      'images': instance.images,
      'material': instance.material,
      'subject': instance.subject,
      'category': instance.category,
      'style': instance.style,
    };
