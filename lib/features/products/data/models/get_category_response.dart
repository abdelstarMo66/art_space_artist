import 'package:json_annotation/json_annotation.dart';
part 'get_category_response.g.dart';

@JsonSerializable()
class GetCategoryResponse {
  String? status;
  int? code;
  String? message;
  @JsonKey(name: 'data')
  List<CategoryData>? categoryData;

  GetCategoryResponse({this.status, this.code, this.message, this.categoryData});

  factory GetCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCategoryResponseFromJson(json);
}

@JsonSerializable()
class CategoryData {
  String? id;
  String? title;

  CategoryData({this.id, this.title});

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}
