import 'package:art_space_artist/features/auction/data/models/create_auction_response.dart';
import 'package:art_space_artist/features/auction/data/models/edit_auction_request_body.dart';
import 'package:art_space_artist/features/auction/data/models/edit_auction_response.dart';
import 'package:art_space_artist/features/auction/data/models/get_all_auction_response.dart';
import 'package:dio/dio.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_service.dart';
import '../../../products/data/models/get_category_response.dart';
import '../../../products/data/models/get_styles_response.dart';
import '../../../products/data/models/get_subject_response.dart';
import '../models/delete_auction_response.dart';
import '../models/get_auction_details_response.dart';

class AuctionRepo {
  final ApiService _apiService;

  AuctionRepo(this._apiService);

  Future<ApiResult<CreateAuctionResponse>> createAuction(
      {required FormData body}) async {
    try {
      final response = await _apiService.createAuction(
        body: body,
        token: 'Bearer $token',
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetStylesResponse>> getStyles() async {
    try {
      final response = await _apiService.getStyles(token: 'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetCategoryResponse>> getCategory() async {
    try {
      final response = await _apiService.getCategory(token: 'Bearer $token');
      return ApiResult.success(response);

    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetSubjectResponse>> getSubject() async {
    try {
      final response = await _apiService.getSubject(token: 'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<GetAllAuctionResponse>> getAllAuction() async {
    try {
      final response = await _apiService.getAllAuctions(token: 'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetAuctionDetailsResponse>> getAuctionDetails({required String auctionId}) async {
    try {
      final response = await _apiService.getAuctionDetails(
          token: 'Bearer $token',
          id: auctionId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  Future<ApiResult<DeleteAuctionResponse>> deleteAuction({
    required String auctionId,
  }) async {
    try {
      final response = await _apiService.deleteAuction(
        token: 'Bearer $token',
        id: auctionId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<EditAuctionResponse>> editeAuction({required String auctionId, required EditAuctionRequestBody editAuctionRequestBody}) async {
    try {
      final response = await _apiService.editAuction(
        token: 'Bearer $token',
        id: auctionId,
        editAuctionRequestBody: editAuctionRequestBody
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }



}
