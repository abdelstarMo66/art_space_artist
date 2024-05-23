import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_product_to_event_request_body.g.dart';

@JsonSerializable()
class AddProductToEventRequestBody {
  final String productId;

  const AddProductToEventRequestBody({required this.productId});

  Map<String, dynamic> toJson() => _$AddProductToEventRequestBodyToJson(this);
}
