import 'package:art_space_artist/core/network/api_service.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/forget_password_request.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/forget_password_response.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/reset_password_request.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/reset_password_response.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/verify_email_request.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/verify_email_response.dart';
import '../../../../../core/network/api_result.dart';

class ForgetPasswordRepo {
  final ApiService _apiService;
  ForgetPasswordRepo(this._apiService);

  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest
      ) async{
    try{
      final response = await _apiService.forgetPassword(forgetPasswordRequest);
      return ApiResult.success(response);
  } catch (error) {
      return ApiResult.failure("$error");
  }
}

 Future<ApiResult<VerifyEmailResponse>> verifyEmail(
     VerifyEmailRequest verifyEmailRequest
     )async {
    try {
      final response = await _apiService.verifyEmail(verifyEmailRequest);
      return ApiResult.success(response);
    } catch(error){
      return ApiResult.failure("$error");
    }
 }

 Future<ApiResult<ResetPasswordResponse>> resetPassword (
     ResetPasswordRequest resetPasswordRequest
     ) async {
    try {
      final response = await _apiService.resetPassword(resetPasswordRequest);
      return ApiResult.success(response);
    } catch(error) {
      return ApiResult.failure("$error");
    }
 }
}