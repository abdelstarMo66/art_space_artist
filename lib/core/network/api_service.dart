
import 'package:art_space_artist/core/network/api_constants.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/forget_password_request.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/reset_password_request.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/reset_password_response.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/verify_email_request.dart';
import 'package:art_space_artist/features/auth/login/data/model/login_request_body.dart';
import 'package:art_space_artist/features/auth/register/data/models/register_response.dart';
import 'package:art_space_artist/features/auth/register/data/models/verify_email_request_body.dart';
import 'package:art_space_artist/features/auth/register/data/models/verify_email_response.dart';
import 'package:art_space_artist/features/events/data/model/create_event_response.dart';
import 'package:art_space_artist/features/products/data/models/add_product_response.dart';
import 'package:art_space_artist/features/products/data/models/delete_product_response.dart';
import 'package:art_space_artist/features/profile/data/model/edit_profile_request_body.dart';
import 'package:art_space_artist/features/profile/data/model/edit_profile_response.dart';
import 'package:art_space_artist/features/profile/data/model/get_profile_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/auth/forgetPassword/data/model/forget_password_response.dart';
import '../../features/auth/forgetPassword/data/model/verify_email_response.dart';
import '../../features/auth/login/data/model/login_response.dart';
import '../../features/products/data/models/get_category_response.dart';
import '../../features/home/data/models/get_my_products_response.dart';
import '../../features/products/data/models/get_product_details_response.dart';
import '../../features/products/data/models/get_styles_response.dart';
import '../../features/products/data/models/get_subject_response.dart';
import '../../features/profile/data/model/change_password_request_body.dart';
import '../../features/profile/data/model/change_password_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstant.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstant.register)
  // @MultiPart()
  Future<RegisterResponse> register({
    // @Part() required RegisterRequestBody registerRequestBody,
    // @Part(contentType: "image/*") required File profileImg,
    @Body() required FormData registerFormData,
  });

  @POST(ApiConstant.forgotPassword)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() ForgetPasswordRequest forgetPasswordRequest,
  );

  @POST(ApiConstant.verifyCode)
  Future<VerifyCodeResponse> verifyCode(
    @Body() VerifyCodeRequest verifyCodeRequest,
  );

  @PUT(ApiConstant.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequest resetPasswordRequest,
  );

  @POST(ApiConstant.verifyEmail)
  Future<VerifyEmailResponse> verifyEmail(
    @Body() VerifyEmailRequestBody verifyEmailRequestBody,
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
  Future<AddProductResponse> addProduct({
    @Body() required FormData body,
    @Header('Authorization') required String token,
  });

  @GET(ApiConstant.getProductDetails)
  Future<GetProductDetailsResponse> getProductDetails({
    @Path('id') required String? id,
    @Header('Authorization') required String token,
  });

  @DELETE(ApiConstant.deleteProduct)
  Future<DeleteProductResponse> deleteProduct({
    @Path('id') required String? id,
    @Header('Authorization') required String token,
  });

  @GET(ApiConstant.getStyles)
  Future<GetStylesResponse> getStyles({
    @Header('Authorization') required String token,
  });

  @GET(ApiConstant.getCategories)
  Future<GetCategoryResponse> getCategory({
    @Header('Authorization') required String token,
  });

  @GET(ApiConstant.getSubjects)
  Future<GetSubjectResponse> getSubject({
    @Header('Authorization') required String token,
  });

  @PATCH(ApiConstant.updateProfile)
  Future<EditProfileResponse> editProfile({
    @Body() required EditProfileRequestBody editProfileRequestBody,
    @Header('Authorization') required String token,
  });

  @PATCH(ApiConstant.changePassword)
  Future<ChangePasswordResponse> changePassword({
    @Body() required ChangePasswordRequestBody changePasswordRequestBody,
    @Header('Authorization') required String token,
  });

  @POST(ApiConstant.createEvent)
  Future<CreateEventResponse> createEvent({
    @Body() required FormData body,
    @Header('Authorization') required String token,
  });
}
