import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_state.freezed.dart';
@freezed
class GetMyProductsState<T> with _$GetMyProductsState<T> {
  const factory GetMyProductsState.initial() = _Initial;
  const factory GetMyProductsState.loading() = Loading;
  const factory GetMyProductsState.success(T data) = Success;
  const factory GetMyProductsState.error({required String error}) = Error;
}