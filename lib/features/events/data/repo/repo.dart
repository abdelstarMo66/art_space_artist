import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/network/api_error_handler.dart';
import 'package:art_space_artist/core/network/api_result.dart';
import 'package:art_space_artist/features/events/data/model/create_event_response.dart';
import 'package:art_space_artist/features/events/data/model/delete_event_response.dart';
import 'package:art_space_artist/features/events/data/model/edit_event_request_body.dart';
import 'package:art_space_artist/features/events/data/model/edit_event_response.dart';
import 'package:art_space_artist/features/events/data/model/get_event_details_response.dart';
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
     return ApiResult.failure(ErrorHandler.handle(error));
   }
  }

  Future<ApiResult<GetEventDetailsResponse>> getEventDetails({required String eventId}) async{
    try{
      final response = await _apiService.getEventDetails(token: 'Bearer $token', id: eventId);
      return ApiResult.success(response);
    } catch(error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DeleteEventResponse>> deleteEvent({required String eventId}) async {
    try {
      final response = await _apiService.deleteEvent(
          token: 'Bearer $token',
          id: eventId
      );
      return ApiResult.success(response);
    } catch(error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<EditEventResponse>> editEvent({
    required String eventId,
    required EditEventRequestBody editEventRequestBody
  }) async {
    try {
      final response = await _apiService.editEvent(
          token: 'Bearer $token',
          id: eventId,
        editEventRequestBody: editEventRequestBody,
      );
      return ApiResult.success(response);
    } catch(error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}