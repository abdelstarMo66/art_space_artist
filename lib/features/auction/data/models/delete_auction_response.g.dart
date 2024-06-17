// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_auction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAuctionResponse _$DeleteAuctionResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteAuctionResponse(
      message: json['message'] as String,
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$DeleteAuctionResponseToJson(
        DeleteAuctionResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
    };
