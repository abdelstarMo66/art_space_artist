import 'package:json_annotation/json_annotation.dart';
part 'edit_event_request_body.g.dart';

@JsonSerializable()
class EditEventRequestBody{
  final String title;
  final String description;
  final int duration;
  final String began;

  EditEventRequestBody({
    required this.title,
    required this.description,
    required this.duration,
    required this.began,
  });

  Map<String, dynamic> toJson() => _$EditEventRequestBodyToJson(this);
}