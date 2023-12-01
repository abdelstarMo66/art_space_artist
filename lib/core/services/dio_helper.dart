import 'package:art_space_artist/core/constants/cache_key_manager.dart';
import 'package:art_space_artist/core/constants/end_point_manager.dart';
import 'package:dio/dio.dart';

import 'cache_helper.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPointManager.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Accept-Language': CacheHelper.getDataFromSharedPreference(
        key: CacheKeyManager.ckAppLang,
      ),
      'Authorization':
          "Bearer ${token ?? CacheHelper.getDataFromSharedPreference(
                key: CacheKeyManager.ckApiToken,
              )}",
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    bool isForm = false,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Accept-Language': CacheHelper.getDataFromSharedPreference(
        key: CacheKeyManager.ckAppLang,
      ),
      'Authorization':
          "Bearer ${token ?? CacheHelper.getDataFromSharedPreference(
                key: CacheKeyManager.ckApiToken,
              )}",
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: body != null && isForm ? FormData.fromMap(body) : body,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    bool isForm = false,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Accept-Language': CacheHelper.getDataFromSharedPreference(
        key: CacheKeyManager.ckAppLang,
      ),
      'Authorization':
          "Bearer ${token ?? CacheHelper.getDataFromSharedPreference(
                key: CacheKeyManager.ckApiToken,
              )}",
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: body != null && isForm ? FormData.fromMap(body) : body,
    );
  }
}
