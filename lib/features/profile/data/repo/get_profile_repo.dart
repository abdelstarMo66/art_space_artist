import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/network/api_service.dart';
import 'package:art_space_artist/features/profile/data/model/get_profile_response.dart';

import '../../../../core/network/api_result.dart';

class GetProfileRepo{
  final ApiService _apiService;
  GetProfileRepo(this._apiService);

  Future<ApiResult<GetProfileResponse>> getProfile() async {
    try {
      final response = await _apiService.getProfile('Bearer $token');
      return ApiResult.success(response);
    } catch(error) {
      return ApiResult.failure(error.toString());
    }
  }
}