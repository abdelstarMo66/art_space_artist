import 'package:json_annotation/json_annotation.dart';
part 'edit_auction_request_body.g.dart';
@JsonSerializable()
class EditAuctionRequestBody {
  String title;
  String description;
  String material;
  String price;
  int duration;
  String began;

  EditAuctionRequestBody({
    required this.title,
    required this.description,
    required this.material,
    required this.price,
    required this.duration,
    required this.began,
  });

  Map<String, dynamic> toJson() => _$EditAuctionRequestBodyToJson(this);
}