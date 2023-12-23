
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
   static const textStyle21 = TextStyle(
      color: ColorManager.primaryColor,
      fontWeight: FontWeight.w400,
      fontSize: 21,
     fontFamily: 'Montserrat'
  );
   static const textStyle24 = TextStyle(
       color: ColorManager.primaryColor,
       fontSize: 24.0,
       fontWeight: FontWeight.w700,
     fontFamily: 'Montserrat'
   );
   static const textStyle20 = TextStyle(
       color: ColorManager.originalBlack,
       fontSize: 20.0,
       fontWeight: FontWeight.w200,
      fontFamily: 'Montserrat',
   );
}