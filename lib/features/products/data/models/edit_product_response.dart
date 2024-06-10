import 'package:json_annotation/json_annotation.dart';
part 'edit_product_response.g.dart';
@JsonSerializable()
class EditProductResponse {
  String ? status;
  int ? code;
  String ? message;

  EditProductResponse({this.status, this.code, this.message});

  factory EditProductResponse.fromJson(Map<String, dynamic> json) => _$EditProductResponseFromJson(json);

}