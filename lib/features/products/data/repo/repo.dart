import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/network/api_service.dart';
import 'package:art_space_artist/features/products/data/models/add_product_response.dart';
import 'package:art_space_artist/features/products/data/models/delete_product_response.dart';
import 'package:art_space_artist/features/products/data/models/get_my_products_response.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_result.dart';
import '../models/get_product_details_response.dart';

class ProductsRepo {
  final ApiService _apiService;

  ProductsRepo(this._apiService);

  Future<ApiResult<GetMyProductsResponse>> getMyProducts() async {
    try {
      final response = await _apiService.getMyProducts('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<AddProductResponse>> addProduct(
      {required FormData body}) async {
    try {
      final response = await _apiService.addProduct(
        body: body,
        token: 'Bearer $token',
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<GetProductDetailsResponse>> getProductDetails({
  required String ?productId,

}) async {
    try {
      final response = await _apiService.getProductDetails(
        token: 'Bearer $token',
        id: productId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<DeleteProductResponse>> deleteProduct({
  required String productId,
}) async {
    try {
      final response = await _apiService.deleteProduct(
        token: 'Bearer $token',
        id: productId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}