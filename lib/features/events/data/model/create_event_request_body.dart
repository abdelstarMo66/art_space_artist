import 'package:json_annotation/json_annotation.dart';
part 'create_event_request_body.g.dart';
@JsonSerializable()
class CreateEventRequestBody {
  final String title;
  final String description;
  final int duration;
  final String began;

  CreateEventRequestBody({
    required this.title,
    required this.description,
    required this.duration,
    required this.began,
});

  Map<String, dynamic> toJson() => _$CreateEventRequestBodyToJson(this);
}