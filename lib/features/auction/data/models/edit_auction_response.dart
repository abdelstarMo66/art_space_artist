
import 'package:json_annotation/json_annotation.dart';
part 'edit_auction_response.g.dart';
@JsonSerializable()
class EditAuctionResponse {
  String message;
  String status;
  int code;

  EditAuctionResponse({required this.message, required this.status,required this.code});

  factory EditAuctionResponse.fromJson(Map<String, dynamic> json) => _$EditAuctionResponseFromJson(json);

}