
import 'package:art_space_artist/core/network/api_constants.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/forget_password_request.dart';
import 'package:art_space_artist/features/auth/login/data/model/login_request_body.dart';
import 'package:art_space_artist/features/auth/register/data/models/register_request_body.dart';
import 'package:art_space_artist/features/auth/register/data/models/register_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/auth/forgetPassword/data/model/forget_password_response.dart';
import '../../features/auth/login/data/model/login_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstant.login)
  Future<LoginResponse> login (
      @Body() LoginRequestBody loginRequestBody,
      );

  @POST(ApiConstant.register)
  Future<RegisterResponse> register (
      @Body() RegisterRequestBody registerRequestBody,
      );

  @POST(ApiConstant.forgotPassword)
  Future<ForgetPasswordResponse> forgetPassword(
      @Body() ForgetPasswordRequest forgetPasswordRequest,
      );
}