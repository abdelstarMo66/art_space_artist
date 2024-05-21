import 'package:json_annotation/json_annotation.dart';
part 'get_event_response.g.dart';
@JsonSerializable()
class GetAllEventsResponse {
  final String status;
  final String message;
  final int code;
  @JsonKey(name: 'data')
  Event event;

  GetAllEventsResponse(this.status, this.message, this.code, this.event);

  factory GetAllEventsResponse.fromJson(Map<String, dynamic> json) => _$GetAllEventsResponseFromJson(json);
}

@JsonSerializable()
class Event {
  Pagination pagination;
  @JsonKey(name: 'events')
  List<EventInfo> eventInfo;

  Event(this.pagination, this.eventInfo);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
@JsonSerializable()
class Pagination {
  int  currentPage;
  int  limit;
  int  numbersOfPages;
  int  totalResults;

  Pagination({required this.currentPage, required this.limit, required this.numbersOfPages, required this.totalResults});

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}

@JsonSerializable()
class EventInfo {
  String id;
  String title;
  String description;
  String imageId;
  String coverImage;
  int duration;
  String began;
  String end;

  EventInfo({required this.id, required this.title, required this.description, required this.imageId, required this.coverImage, required this.duration, required this.began, required this.end});

  factory EventInfo.fromJson(Map<String, dynamic> json) => _$EventInfoFromJson(json);
}