import 'package:json_annotation/json_annotation.dart';
part 'add_product_response.g.dart';

@JsonSerializable()
class AddProductResponse {
  final String status;
  final int code;
  final String message;
  final Data data;

  const AddProductResponse({required this.code,required this.message,required this.status, required this.data,});

  factory AddProductResponse.fromJson(Map<String, dynamic> json) =>
      _$AddProductResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String id;

  const Data({required this.id});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
