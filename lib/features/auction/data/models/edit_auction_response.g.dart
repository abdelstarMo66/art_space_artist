// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_auction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditAuctionResponse _$EditAuctionResponseFromJson(Map<String, dynamic> json) =>
    EditAuctionResponse(
      message: json['message'] as String,
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$EditAuctionResponseToJson(
        EditAuctionResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
    };
