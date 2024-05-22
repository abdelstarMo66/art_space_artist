import 'package:art_space_artist/features/auction/data/models/create_auction_response.dart';
import 'package:dio/dio.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_service.dart';
import '../../../products/data/models/get_category_response.dart';
import '../../../products/data/models/get_styles_response.dart';
import '../../../products/data/models/get_subject_response.dart';

class AuctionRepo {
  final ApiService _apiService;

  AuctionRepo(this._apiService);

  Future<ApiResult<CreateAuctionResponse>> createAuction(
      {required FormData body}) async {
    try {
      final response = await _apiService.createAuction(
        body: body,
        token: 'Bearer $token',
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<GetStylesResponse>> getStyles() async {
    try {
      final response = await _apiService.getStyles(token: 'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<GetCategoryResponse>> getCategory() async {
    try {
      final response = await _apiService.getCategory(token: 'Bearer $token');
      return ApiResult.success(response);

    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<GetSubjectResponse>> getSubject() async {
    try {
      final response = await _apiService.getSubject(token: 'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
