import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/cache_key_manager.dart';
import '../../services/cache_helper.dart';
import 'app_state.dart';


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  late ThemeMode _themeMode;

  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeMode get themeMode => _themeMode;


  initAppCubit() {
    _initDarkTheme();
  }

  Future changeAppLanguage(Locale locale) async {
    _locale = locale;
    CacheHelper.saveDataSharedPreference(
      key: CacheKeyManager.ckAppLang,
      value: _locale.languageCode,
    );
    emit(AppLanguageUpdateState());
  }

  Future _initDarkTheme() async {
    final isDarkTheme = CacheHelper.getDataFromSharedPreference(
          key: CacheKeyManager.ckIsDarkTheme,) ?? false;
    _themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    await CacheHelper.saveDataSharedPreference(
      key: CacheKeyManager.ckIsDarkTheme,
      value: isDarkTheme,
    );
    _isDark = _themeMode == ThemeMode.dark;
    emit(AppThemeUpdateState());
  }

  Future toggleTheme() async {
    _themeMode = _isDark ? ThemeMode.light : ThemeMode.dark;
    await CacheHelper.saveDataSharedPreference(
      key: CacheKeyManager.ckIsDarkTheme,
      value: _themeMode == ThemeMode.dark,
    );
    _isDark = _themeMode == ThemeMode.dark;
    emit(AppThemeUpdateState());
  }

  bool lastScreenOnBoarding = false;
}
