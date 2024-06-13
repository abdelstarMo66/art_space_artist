import 'package:art_space_artist/features/home/data/models/get_my_products_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_auction_details_response.g.dart';

@JsonSerializable()
class GetAuctionDetailsResponse {
  String status;
  String code;
  String message;
  @JsonKey(name: 'data')
  AuctionInfo auctionInfo;

  GetAuctionDetailsResponse(
      this.status, this.code, this.message, this.auctionInfo);

  factory GetAuctionDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAuctionDetailsResponseFromJson(json);
}

@JsonSerializable()
class AuctionInfo {
  String id;
  String title;
  String description;
  int price;
  int duration;
  String began;
  String end;
  Images coverImage;
  List<Images> images;
  String material;
  String subject;
  String category;
  String style;

  AuctionInfo(
      this.id,
      this.title,
      this.description,
      this.price,
      this.duration,
      this.began,
      this.coverImage,
      this.images,
      this.material,
      this.subject,
      this.category,
      this.end,
      this.style);

  factory AuctionInfo.fromJson(Map<String, dynamic> json) =>
      _$AuctionInfoFromJson(json);
}
