// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_auction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllAuctionResponse _$GetAllAuctionResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllAuctionResponse(
      json['status'] as String,
      (json['code'] as num).toInt(),
      json['message'] as String,
      Auctions.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllAuctionResponseToJson(
        GetAllAuctionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.auctions,
    };

Auctions _$AuctionsFromJson(Map<String, dynamic> json) => Auctions(
      Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      (json['auctions'] as List<dynamic>)
          .map((e) => AuctionsInformations.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AuctionsToJson(Auctions instance) => <String, dynamic>{
      'pagination': instance.pagination,
      'auctions': instance.actionsInfo,
    };

AuctionsInformations _$AuctionsInformationsFromJson(
        Map<String, dynamic> json) =>
    AuctionsInformations(
      json['id'] as String,
      json['title'] as String,
      json['description'] as String,
      json['isAvailable'] as bool,
      json['category'] as String,
      json['style'] as String,
      json['subject'] as String,
      Images.fromJson(json['coverImage'] as Map<String, dynamic>),
      (json['duration'] as num).toInt(),
      json['isLaunch'] as bool,
      json['isEnded'] as bool,
      json['finalUser'] == null
          ? null
          : FinalUser.fromJson(json['finalUser'] as Map<String, dynamic>),
      (json['images'] as List<dynamic>)
          .map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$AuctionsInformationsToJson(
        AuctionsInformations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'isAvailable': instance.isAvailable,
      'price': instance.price,
      'category': instance.category,
      'style': instance.style,
      'subject': instance.subject,
      'coverImage': instance.coverImage,
      'duration': instance.duration,
      'isLaunch': instance.isLaunch,
      'isEnded': instance.isEnded,
      'finalUser': instance.finalUser,
      'images': instance.images,
    };

FinalUser _$FinalUserFromJson(Map<String, dynamic> json) => FinalUser(
      json['id'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$FinalUserToJson(FinalUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
