// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllEventsResponse _$GetAllEventsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllEventsResponse(
      json['status'] as String,
      json['message'] as String,
      (json['code'] as num).toInt(),
      Event.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllEventsResponseToJson(
        GetAllEventsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.event,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      (json['events'] as List<dynamic>)
          .map((e) => EventInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'pagination': instance.pagination,
      'events': instance.eventInfo,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      currentPage: (json['currentPage'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      numbersOfPages: (json['numbersOfPages'] as num).toInt(),
      totalResults: (json['totalResults'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'limit': instance.limit,
      'numbersOfPages': instance.numbersOfPages,
      'totalResults': instance.totalResults,
    };

EventInfo _$EventInfoFromJson(Map<String, dynamic> json) => EventInfo(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageId: json['imageId'] as String,
      coverImage: json['coverImage'] as String,
      duration: (json['duration'] as num).toInt(),
      began: json['began'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$EventInfoToJson(EventInfo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageId': instance.imageId,
      'coverImage': instance.coverImage,
      'duration': instance.duration,
      'began': instance.began,
      'end': instance.end,
    };
