import 'dart:io';

import 'package:art_space_artist/core/helpers/cache_helper.dart';
import 'package:art_space_artist/core/network/api_constants.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/forget_password_request.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/reset_password_request.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/reset_password_response.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/verify_email_request.dart';
import 'package:art_space_artist/features/auth/login/data/model/login_request_body.dart';
import 'package:art_space_artist/features/auth/register/data/models/register_request_body.dart';
import 'package:art_space_artist/features/auth/register/data/models/register_response.dart';
import 'package:art_space_artist/features/products/data/models/add_product_request_body.dart';
import 'package:art_space_artist/features/products/data/models/add_product_response.dart';
import 'package:art_space_artist/features/profile/data/model/get_profile_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../features/auth/forgetPassword/data/model/forget_password_response.dart';
import '../../features/auth/forgetPassword/data/model/verify_email_response.dart';
import '../../features/auth/login/data/model/login_response.dart';
import '../../features/products/data/models/get_my_products_response.dart';

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

  @POST(ApiConstant.verifyCode)
  Future<VerifyEmailResponse> verifyEmail (
      @Body() VerifyEmailRequest verifyEmailRequest,
      );

  @PUT(ApiConstant.resetPassword)
  Future<ResetPasswordResponse> resetPassword (
      @Body() ResetPasswordRequest resetPasswordRequest,
      );

  @GET(ApiConstant.getProfile)
  Future<GetProfileResponse> getProfile(
      @Header('Authorization') String token,
      );

  @GET(ApiConstant.getProducts)
  Future<GetMyProductsResponse> getMyProducts(
      @Header('Authorization') String token,
      );

  @POST(ApiConstant.addProduct)
  @MultiPart()
  Future<AddProductResponse> addProduct ({
    @Part(contentType: "image/*") required File coverImage,
    @Body() required AddProductRequestBody addProductRequestBody,
    @Header('Authorization') required String token,
});
}