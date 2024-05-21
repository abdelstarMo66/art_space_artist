import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/network/api_result.dart';
import 'package:art_space_artist/features/events/data/model/create_event_response.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/api_service.dart';

class EventRepo{
  final ApiService _apiService;

  EventRepo(this._apiService);

  Future<ApiResult<CreateEventResponse>> createEvent({required FormData requestBody}) async{
   try{
     final response = await _apiService.createEvent(body: requestBody,
         token: 'Bearer $token');
     return ApiResult.success(response);
   } catch(error) {
     return ApiResult.failure(error.toString());
   }
  }

}