import 'package:json_annotation/json_annotation.dart';
part 'delete_specific_image_response.g.dart';

@JsonSerializable()
class DeleteSpecificImageResponse {
  String? message;
  String? status;
  String? code;

  DeleteSpecificImageResponse({this.message, this.status, this.code});

  factory DeleteSpecificImageResponse.fromJson(Map<String, dynamic> json) => _$DeleteSpecificImageResponseFromJson(json);
}
