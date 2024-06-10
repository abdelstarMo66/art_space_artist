import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/network/api_service.dart';
import 'package:art_space_artist/features/products/data/models/add_product_response.dart';
import 'package:art_space_artist/features/products/data/models/add_product_to_event_request_body.dart';
import 'package:art_space_artist/features/products/data/models/add_product_to_event_response.dart';
import 'package:art_space_artist/features/products/data/models/delete_product_response.dart';
import 'package:art_space_artist/features/products/data/models/edit_product_request_body.dart';
import 'package:art_space_artist/features/products/data/models/edit_product_response.dart';
import 'package:art_space_artist/features/products/data/models/get_styles_response.dart';
import 'package:art_space_artist/features/products/data/models/get_subject_response.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_result.dart';
import '../models/get_category_response.dart';
import '../models/get_product_details_response.dart';

class ProductsRepo {
  final ApiService _apiService;

  ProductsRepo(this._apiService);

  Future<ApiResult<AddProductResponse>> addProduct(
      {required FormData body}) async {
    try {
      final response = await _apiService.addProduct(
        body: body,
        token: 'Bearer $token',
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<GetProductDetailsResponse>> getProductDetails({
    required String productId,
  }) async {
    try {
      final response = await _apiService.getProductDetails(
        token: 'Bearer $token',
        id: productId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<DeleteProductResponse>> deleteProduct({
    required String productId,
  }) async {
    try {
      final response = await _apiService.deleteProduct(
        token: 'Bearer $token',
        id: productId,
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

  Future<ApiResult<AddProductToEventResponse>> addProductToEvent({
    required String eventId,
    required AddProductToEventRequestBody addProductToEventRequestBody,
  }) async {
    try {
      final response = await _apiService.addProductToEvent(
        token: 'Bearer $token',
        eventId: eventId,
        addProductToEventRequestBody: addProductToEventRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<EditProductResponse>> editProduct ({
    required String productId,
    required EditProductRequestBody editProductRequestBody,
}) async {
    try {
      final response = await _apiService.editProduct(
        token: 'Bearer $token',
        productId: productId,
        editProductRequestBody: editProductRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
