import 'package:freezed_annotation/freezed_annotation.dart';
part 'event_state.freezed.dart';
@freezed
class EventState<T> with _$EventState<T> {
  const factory EventState.initial() = _Initial;
  const factory EventState.createEventLoading() = CreateEventLoading;
  const factory EventState.createEventSuccess(T event) = CreateEventSuccess;
  const factory EventState.createEventFailure(String message) = CreateEventFailure;
  const factory EventState.addEventCoverImage() = AddEventCoverImage;
}