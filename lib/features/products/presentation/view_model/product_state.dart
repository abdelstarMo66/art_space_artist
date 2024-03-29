import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_state.freezed.dart';
@freezed
class ProductsState<T> with _$ProductsState<T> {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.getProductLoading() = GetProductLoading;
  const factory ProductsState.getProductSuccess(T data) = GetProductSuccess;
  const factory ProductsState.getProductError({required String error}) = GetProductError;


  const factory ProductsState.addProductLoading() = AddProductLoading;
  const factory ProductsState.addProductSuccess(T data) = AddProductSuccess;
  const factory ProductsState.addProductError({required String error}) = AddProductError;
}