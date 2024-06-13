import 'package:json_annotation/json_annotation.dart';
part 'get_my_products_response.g.dart';
@JsonSerializable()
class GetAllProductsResponse {
  final String? status;
  final String? message;
  int? code;
  @JsonKey(name: 'data')
  Products? products;

  GetAllProductsResponse(
      {this.status, this.code, this.message, this.products});

  factory GetAllProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsResponseFromJson(json);
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
  Images coverImage;

  ProductsInfo({required this.id, required this.title, required this.description, required this.price, required this.coverImage, required this.isAvailable, required this.category});

  factory ProductsInfo.fromJson(Map<String, dynamic> json) => _$ProductsInfoFromJson(json);
}
@JsonSerializable()
class Images {
  String ? imageId;
  String ? image;

  Images({this.imageId, this.image});
  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}