import 'package:art_space_artist/core/helpers/cache_helper.dart';

enum ToastState {
  success,
  warning,
  error,
}

bool onBoardingSeen = CacheHelper.getDataFromSharedPreference(key: 'onBoarding') == null ? false : true;
bool loginDone = CacheHelper.getDataFromSharedPreference(key: 'token') == null ? false : true;

String token = CacheHelper.getDataFromSharedPreference(key: 'token');