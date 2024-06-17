
import 'package:json_annotation/json_annotation.dart';
part 'delete_auction_response.g.dart';
@JsonSerializable()
class DeleteAuctionResponse {
  String message;
  String status;
  int code;

  DeleteAuctionResponse({required this.message, required this.status,required this.code});

  factory DeleteAuctionResponse.fromJson(Map<String, dynamic> json) => _$DeleteAuctionResponseFromJson(json);
}