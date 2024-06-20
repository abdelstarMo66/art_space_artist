import 'package:json_annotation/json_annotation.dart';
part 'edit_event_response.g.dart';
@JsonSerializable()
class EditEventResponse {
  String message;
  String status;
  int code;
EditEventResponse(this.message, this.status, this.code);

  factory EditEventResponse.fromJson(Map<String, dynamic> json) => _$EditEventResponseFromJson(json);
}