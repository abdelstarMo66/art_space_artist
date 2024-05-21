import 'package:json_annotation/json_annotation.dart';

part 'get_product_details_response.g.dart';

@JsonSerializable()
class GetProductDetailsResponse {
  final String message;
  final String status;
  final int code;
  @JsonKey(name: "data")
  final ProductDetails productDetails;

  GetProductDetailsResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.productDetails,
  });

  factory GetProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductDetailsResponseFromJson(json);
}

@JsonSerializable()
class ProductDetails {
  final String id;
  final String title;
  final String description;
  final int price;
  final bool isAvailable;
  final String category;
  final String style;
  final String subject;
  final double height;
  final double width;
  final double depth;
  final CoverImage coverImage;
  final List<CoverImage> images;
  final String? material;

  ProductDetails({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.isAvailable,
    required this.category,
    required this.style,
    required this.subject,
    required this.height,
    required this.width,
    required this.depth,
    required this.coverImage,
    required this.images,
    this.material,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);
}

@JsonSerializable()
class CoverImage {
  String imageId;
  String image;

  CoverImage({required this.imageId, required this.image});

  factory CoverImage.fromJson(Map<String, dynamic> json) =>
      _$CoverImageFromJson(json);
}
