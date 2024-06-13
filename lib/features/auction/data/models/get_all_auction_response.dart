import 'package:json_annotation/json_annotation.dart';
import '../../../home/data/models/get_my_products_response.dart';
part 'get_all_auction_response.g.dart';
@JsonSerializable()
class GetAllAuctionResponse {
  String status;
  int code;
  String message;
  @JsonKey(name: 'data')
  Auctions auctions;

  GetAllAuctionResponse(this.status, this.code, this.message, this.auctions);

  factory GetAllAuctionResponse.fromJson(Map<String,dynamic > json) =>
      _$GetAllAuctionResponseFromJson(json);
}

@JsonSerializable()
class Auctions {
  Pagination pagination;
  @JsonKey(name: "auctions")
  List<AuctionInfo> actionsInfo;

  Auctions(this.pagination, this.actionsInfo);

  factory Auctions.fromJson( Map<String, dynamic> json ) => _$AuctionsFromJson(json);
}

@JsonSerializable()
class AuctionInfo {
  String id;
  String title;
  String description;
  bool isAvailable;
  int price;
  String category;
  String style;
  String subject;
  Images coverImage;
  int duration;
  bool isLaunch;
  bool isEnded;
  FinalUser ?finalUser;
  List<Images> images;

  AuctionInfo(
      this.id,
      this.title,
      this.description,
      this.isAvailable,
      this.category,
      this.style,
      this.subject,
      this.coverImage,
      this.duration,
      this.isLaunch,
      this.isEnded,
      this.finalUser,
      this.images,
      this.price
      );

  factory AuctionInfo.fromJson(Map<String, dynamic> json) => _$AuctionInfoFromJson(json);
}

@JsonSerializable()
class FinalUser {
  String ?id;
  String ?name;

  FinalUser(this.id, this.name);

  factory FinalUser.fromJson(Map<String, dynamic> json) => _$FinalUserFromJson(json);
}
