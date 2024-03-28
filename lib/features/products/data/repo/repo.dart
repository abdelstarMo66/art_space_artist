import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/network/api_service.dart';
import 'package:art_space_artist/features/products/data/models/get_my_products_response.dart';

import '../../../../core/network/api_result.dart';

class GetMyProductsRepo{
  final ApiService _apiService;
  GetMyProductsRepo(this._apiService);

  Future<ApiResult<GetMyProductsResponse>> getMyProducts() async{
    try{
      final response = await _apiService.getMyProducts('Bearer $token');
      return ApiResult.success(response);
    } catch(error) {
      return ApiResult.failure(error.toString());
    }
  }
}