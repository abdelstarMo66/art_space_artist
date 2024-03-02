import 'package:art_space_artist/core/network/api_service.dart';
import 'package:art_space_artist/features/auth/login/data/model/login_request_body.dart';
import 'package:art_space_artist/features/auth/login/data/model/login_response.dart';
import '../../../../../core/network/api_result.dart';

class LoginRepo{
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login (
      LoginRequestBody loginRequestBody) async{
  try {
    final response = await _apiService.login(loginRequestBody);
    return ApiResult.success(response);
  }  catch (error){
    return  ApiResult.failure('$error');
  }
  }
}