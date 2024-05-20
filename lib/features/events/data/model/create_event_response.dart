import 'package:json_annotation/json_annotation.dart';
part 'create_event_response.g.dart';

@JsonSerializable()
class CreateEventResponse {
  String? status;
  int? code;
  String? message;

  CreateEventResponse({this.code, this.message, this.status});

  factory CreateEventResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateEventResponseFromJson(json);
}
