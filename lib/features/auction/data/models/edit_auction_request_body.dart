import 'package:json_annotation/json_annotation.dart';
part 'edit_auction_request_body.g.dart';
@JsonSerializable()
class EditAuctionRequestBody {
  String ?title;
  String ?description;
  String ?material;
  String ?height;
  String ?weight;
  String ?depth;
  String ?began;

  EditAuctionRequestBody({
    required this.title,
    required this.description,
    required this.material,
    required this.height,
    required this.weight,
    required this.depth,
    required this.began,
  });

  Map<String, dynamic> toJson() => _$EditAuctionRequestBodyToJson(this);
}