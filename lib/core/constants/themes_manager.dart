import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:flutter/material.dart';

class ThemesManager {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorManager.primaryColor,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorManager.primaryColor,
  );
}
