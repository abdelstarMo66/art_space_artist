import 'package:art_space_artist/core/network/api_result.dart';
import 'package:art_space_artist/core/network/api_service.dart';

import '../../../../core/constants/constants.dart';
import '../models/get_my_products_response.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<GetMyProductsResponse>> getMyProducts() async {
    try {
      final response = await _apiService.getMyProducts('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}