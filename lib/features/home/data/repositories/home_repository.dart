import 'package:art_space_artist/core/network/api_result.dart';
import 'package:art_space_artist/core/network/api_service.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/network/api_error_handler.dart';
import '../models/get_event_response.dart';
import '../models/get_my_products_response.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<GetAllProductsResponse>> getMyProducts() async {
    try {
      final response = await _apiService.getMyProducts(token: 'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetAllEventsResponse>> getAllEvents() async {
    try {
      final response = await _apiService.getAllEvents(token: 'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}