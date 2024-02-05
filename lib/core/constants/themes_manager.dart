import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:flutter/material.dart';

class ThemesManager {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorManager.primaryColor,
    appBarTheme: appBarTheme
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorManager.primaryColor,
    appBarTheme: appBarTheme
  );

  static const appBarTheme = AppBarTheme(
    backgroundColor: ColorManager.originalWhite,
    elevation: 0.0,
    titleSpacing: 20.0,
    iconTheme: IconThemeData(
      color: ColorManager.originalWhite,
    )
  );
}
