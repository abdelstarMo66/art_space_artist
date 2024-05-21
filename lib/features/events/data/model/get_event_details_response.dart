import 'package:json_annotation/json_annotation.dart';
part 'get_event_details_response.g.dart';
@JsonSerializable()
class GetEventDetailsResponse {
  String status;
  int code;
  String message;
  @JsonKey(name: 'data')
  EventInfo eventInfo;

  GetEventDetailsResponse(this.status, this.code, this.message, this.eventInfo);

  factory GetEventDetailsResponse.fromJson(Map<String, dynamic> json) => _$GetEventDetailsResponseFromJson(json);
}

@JsonSerializable()
class EventInfo{
  String id;
  String title;
  String description;
  String imageId;
  String coverImage;
  int duration;
  String began;
  String end;
  List<Products> products;

  EventInfo(this.id, this.title, this.description, this.imageId, this.coverImage, this.duration, this.began, this.end, this.products);
  factory EventInfo.fromJson(Map<String, dynamic> json) => _$EventInfoFromJson(json);
}

@JsonSerializable()
class Products{
  String id;
  String title;
  num price;
  String coverImage;
  String category;

  Products(this.id, this.title, this.price, this.coverImage, this.category);
  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);
}

