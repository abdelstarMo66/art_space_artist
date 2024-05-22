import 'package:json_annotation/json_annotation.dart';
part 'create_auction_response.g.dart';

@JsonSerializable()
class CreateAuctionResponse {
  String? status;
  int? code;
  String? message;

  CreateAuctionResponse({this.code, this.message, this.status});

  factory CreateAuctionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAuctionResponseFromJson(json);
}
