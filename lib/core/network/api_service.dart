
import 'package:art_space_artist/core/network/api_constants.dart';
import 'package:art_space_artist/features/auth/data/model/login_request_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/auth/data/model/login_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstant.login)
  Future<LoginResponse> login (
      @Body() LoginRequestBody loginRequestBody,
      );
}