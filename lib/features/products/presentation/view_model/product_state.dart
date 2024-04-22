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
  
  const factory ProductsState.addCoverPhotoProduct() = AddCoverPhotoProduct;
  const factory ProductsState.addProductImages() = AddProductImages;
  const factory ProductsState.deleteProductImages() = DeleteProductImages;

  const factory ProductsState.getProductDetailsLoading() = GetProductDetailsLoading;
  const factory ProductsState.getProductDetailsSuccess(T data) = GetProductDetailsSuccess;
  const factory ProductsState.getProductDetailsError({required String error}) = GetProductDetailsError;

  const factory ProductsState.deleteProductLoading() = DeleteProductLoading;
  const factory ProductsState.deleteProductSuccess(T data) = DeleteProductSuccess;
  const factory ProductsState.deleteProductError({required String error}) = DeleteProductError;

  const factory ProductsState.getStylesLoading() = GetStylesLoading;
  const factory ProductsState.getStylesSuccess(T data) = GetStylesSuccess;
  const factory ProductsState.getStylesError({required String error}) = GetStylesError;

  const factory ProductsState.getCategoriesLoading() = GetCategoriesLoading;
  const factory ProductsState.getCategoriesSuccess(T data) = GetCategoriesSuccess;
  const factory ProductsState.getCategoriesError({required String error}) = GetCategoriesError;

  const factory ProductsState.getSubjectsLoading() = GetBrandsLoading;
  const factory ProductsState.getSubjectsSuccess(T data) = GetBrandsSuccess;
  const factory ProductsState.getSubjectsError({required String error}) = GetBrandsError;
}