import 'package:freezed_annotation/freezed_annotation.dart';
part 'event_state.freezed.dart';
@freezed
class EventState<T> with _$EventState<T> {
  const factory EventState.initial() = _Initial;
  const factory EventState.createEventLoading() = CreateEventLoading;
  const factory EventState.createEventSuccess(T event) = CreateEventSuccess;
  const factory EventState.createEventFailure(String message) = CreateEventFailure;

  const factory EventState.addEventCoverImage() = AddEventCoverImage;

  const factory EventState.getEventDetailsLoading() = GetEventDetailsLoading;
  const factory EventState.getEventDetailsSuccess(T event) = GetEventDetailsSuccess;
  const factory EventState.getEventDetailsFailure(String message) = GetEventDetailsFailure;

  const factory EventState.deleteEventLoading() = DeleteEventLoading;
  const factory EventState.deleteEventSuccess(T event) = DeleteEventSuccess;
  const factory EventState.deleteEventError(String message) = DeleteEventError;
}