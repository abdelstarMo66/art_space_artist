import 'package:json_annotation/json_annotation.dart';
part 'add_product_response.g.dart';

@JsonSerializable()
class AddProductResponse {
  String? status;
  int? code;
  String? message;

  AddProductResponse({this.code, this.message, this.status});

  factory AddProductResponse.fromJson(Map<String, dynamic> json) =>
      _$AddProductResponseFromJson(json);
}
