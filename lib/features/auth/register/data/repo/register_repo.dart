import 'package:art_space_artist/core/network/api_service.dart';
import 'package:art_space_artist/features/auth/register/data/models/register_response.dart';
import 'package:art_space_artist/features/auth/register/data/models/verify_email_request_body.dart';
import 'package:art_space_artist/features/auth/register/data/models/verify_email_response.dart';

import '../../../../../core/network/api_result.dart';
import '../models/register_request_body.dart';

class RegisterRepo {
  final ApiService _apiService;

  RegisterRepo(this._apiService);

  Future<ApiResult<RegisterResponse>> register(
      RegisterRequestBody registerRequestBody) async {
    try {
      final response = await _apiService.register(registerRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure('$error');
    }
  }

  Future<ApiResult<VerifyEmailResponse>> verifyEmail (
      VerifyEmailRequestBody verifyEmailRequestBody) async {
    try {
      final response = await _apiService.verifyEmail(verifyEmailRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure('$error');
    }
  }
}
