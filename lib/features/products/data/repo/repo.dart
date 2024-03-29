import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/network/api_service.dart';
import 'package:art_space_artist/features/products/data/models/add_product_response.dart';
import 'package:art_space_artist/features/products/data/models/get_my_products_response.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_result.dart';

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
}
