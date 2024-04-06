
import 'package:json_annotation/json_annotation.dart';
part'get_product_details_response.g.dart';
@JsonSerializable()
class GetProductDetailsResponse {
  final String? message;
  final String? status;
  final int? code;
  @JsonKey(name: "data")
  final ProductDetails? productDetails;

  GetProductDetailsResponse({
    this.message,
    this.status,
    this.code,
    this.productDetails,

});
  factory GetProductDetailsResponse.fromJson(Map<String, dynamic> json) => _$GetProductDetailsResponseFromJson(json);
}
@JsonSerializable()
class ProductDetails {
  final String? id;
  final String? title;
  final String? description;
  final int? price;
  final bool? isAvailable;
  final String? category;
  final String? style;
  final String? subject;
  final int? height;
  final int? width;
  final double ?depth;
  final CoverImage? coverImage;
  final List<CoverImage>? productImage;
  final String? material;

  ProductDetails({
  this.id,
  this.title,
  this.description,
  this.price,
  this.isAvailable,
  this.category,
  this.style,
  this.subject,
  this.height,
  this.width,
  this.depth,
  this.coverImage,
  this.productImage,
    this.material,
});

  factory ProductDetails.fromJson(Map<String, dynamic> json) => _$ProductDetailsFromJson(json);
}
@JsonSerializable()
class CoverImage {
  String ? imageId;
  String? profileImg;

  CoverImage({this.imageId, this.profileImg});
  factory CoverImage.fromJson(Map<String, dynamic> json) => _$CoverImageFromJson(json);
}