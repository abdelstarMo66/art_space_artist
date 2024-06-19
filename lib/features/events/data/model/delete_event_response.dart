import 'package:json_annotation/json_annotation.dart';
part 'delete_event_response.g.dart';
@JsonSerializable()
class DeleteEventResponse {
  String message;
  String status;
  int code;

  DeleteEventResponse({ required this.message, required this.status, required this.code});

  factory DeleteEventResponse.fromJson(Map<String, dynamic> json) => _$DeleteEventResponseFromJson(json);
}
