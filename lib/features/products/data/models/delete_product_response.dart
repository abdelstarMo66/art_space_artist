
import 'package:json_annotation/json_annotation.dart';
part 'delete_product_response.g.dart';
@JsonSerializable()
class DeleteProductResponse {
  String ?message;
  String?status;
  String?code;

  DeleteProductResponse({this.message, this.status, this.code});

  factory DeleteProductResponse.fromJson(Map<String, dynamic> json) => _$DeleteProductResponseFromJson(json);
}