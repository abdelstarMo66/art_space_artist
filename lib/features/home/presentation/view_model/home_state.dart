import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';
@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _InitialState;
  const factory HomeState.getProductLoading() = GetHomeProductLoading;
  const factory HomeState.getProductSuccess(T data) = GetHomeProductSuccess;
  const factory HomeState.getProductError({required String error}) = GetHomeProductError;
}