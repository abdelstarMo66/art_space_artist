import 'package:json_annotation/json_annotation.dart';
part 'get_my_products_response.g.dart';
@JsonSerializable()
class GetMyProductsResponse {
  final String? status;
  final String? message;
  int? code;
  @JsonKey(name: 'data')
  Products? products;

  GetMyProductsResponse(
      {this.status, this.code, this.message, this.products});

  factory GetMyProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMyProductsResponseFromJson(json);
}

@JsonSerializable()
class Products {
  Pagination pagination;
  @JsonKey(name: 'products')
  List<ProductsInfo> productsInfo;

  Products({required this.productsInfo, required this.pagination});

  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);
}

@JsonSerializable()
class Pagination {
  int  currentPage;
  int  limit;
  int  numbersOfPages;
  int  totalResults;

  Pagination({required this.currentPage, required this.limit, required this.numbersOfPages, required this.totalResults});

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}
@JsonSerializable()
class ProductsInfo {
  String  id;
  String  title;
  String  description;
  String  category;
  double  price;
  bool  isAvailable;
  CoverImage coverImage;

  ProductsInfo({required this.id, required this.title, required this.description, required this.price, required this.coverImage, required this.isAvailable, required this.category});

  factory ProductsInfo.fromJson(Map<String, dynamic> json) => _$ProductsInfoFromJson(json);
}
@JsonSerializable()
class CoverImage {
  String ? imageId;
  String? image;

  CoverImage({this.imageId, this.image});
  factory CoverImage.fromJson(Map<String, dynamic> json) => _$CoverImageFromJson(json);
}