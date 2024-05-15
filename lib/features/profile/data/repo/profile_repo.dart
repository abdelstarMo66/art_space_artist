import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/network/api_service.dart';
import 'package:art_space_artist/features/profile/data/model/change_password_response.dart';
import 'package:art_space_artist/features/profile/data/model/edit_profile_request_body.dart';
import 'package:art_space_artist/features/profile/data/model/edit_profile_response.dart';
import 'package:art_space_artist/features/profile/data/model/get_profile_response.dart';

import '../../../../core/network/api_result.dart';
import '../model/change_password_request_body.dart';

class ProfileRepo {
  final ApiService _apiService;
  ProfileRepo(this._apiService);

  Future<ApiResult<GetProfileResponse>> getProfile() async {
    try {
      final response = await _apiService.getProfile('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<EditProfileResponse>> editProfile(
      {required EditProfileRequestBody editProfileRequestBody}) async {
    try {
      final response = await _apiService.editProfile(
        token: 'Bearer $token',
        editProfileRequestBody: editProfileRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<ChangePasswordResponse>> changePassword({
    required  ChangePasswordRequestBody changePasswordRequestBody}) async {
    try {
      final response = await _apiService.changePassword(
        token: 'Bearer $token',
        changePasswordRequestBody: changePasswordRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

}
