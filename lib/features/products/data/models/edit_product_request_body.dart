import 'package:json_annotation/json_annotation.dart';
part 'edit_product_request_body.g.dart';
@JsonSerializable()
class EditProductRequestBody {
  String ?title;
  String ?description;
  String ?price;
  String? height;
  String? weight;
  String? depth;

  EditProductRequestBody({
    required this.title,
    required this.description,
    required this.price,
    required this.height,
    required this.weight,
    required this.depth,
});

  Map<String, dynamic> toJson() => _$EditProductRequestBodyToJson(this);
}