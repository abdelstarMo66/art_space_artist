import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_specific_image_request_body.g.dart';

@JsonSerializable()
class DeleteSpecificImageRequestBody {
  final String publicId;

  const DeleteSpecificImageRequestBody({required this.publicId});

  Map<String, dynamic> toJson() => _$DeleteSpecificImageRequestBodyToJson(this);
}
