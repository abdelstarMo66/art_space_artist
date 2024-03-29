import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';
part 'add_product_request_body.g.dart';
@JsonSerializable()
class AddProductRequestBody {
  final String title;
  final String description;
  final double price;
  final String category;
  final String subject;
  final String style;
  final double height;
  final double width;
  final double depth;
  final String material;

  AddProductRequestBody({
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.subject,
    required this.height,
    required this.width,
    required this.depth,
    required this.material,
    required this.style,
});

  Map<String, dynamic> toJson() => _$AddProductRequestBodyToJson(this);
}