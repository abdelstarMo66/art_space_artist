// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_auction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAuctionResponse _$CreateAuctionResponseFromJson(
        Map<String, dynamic> json) =>
    CreateAuctionResponse(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CreateAuctionResponseToJson(
        CreateAuctionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
