import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_product_to_event_response.g.dart';

@JsonSerializable()
class AddProductToEventResponse {
  final String status;
  final int code;
  final String message;

  const AddProductToEventResponse({
    required this.status,
    required this.code,
    required this.message,
  });

  factory AddProductToEventResponse.fromJson(Map<String, dynamic> json) =>
      _$AddProductToEventResponseFromJson(json);
}
