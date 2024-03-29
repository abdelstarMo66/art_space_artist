import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
   static const textStyle21 = TextStyle(
      color: ColorManager.primaryColor,
      fontWeight: FontWeight.w400,
      fontSize: 21,
     fontFamily: 'Montserrat',
     overflow: TextOverflow.ellipsis
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
   static const textStyle18 = TextStyle(
       color: ColorManager.originalBlack,
       fontSize: 18,
       fontWeight: FontWeight.w200,
      fontFamily: 'Montserrat',
   );
   static const textStyle36 = TextStyle(
       color: ColorManager.originalBlack,
       fontSize: 34,
       fontWeight: FontWeight.bold,
      fontFamily: 'Montserrat',
   );
   static const textStyle30 = TextStyle(
       color: ColorManager.originalBlack,
       fontSize: 30,
       fontWeight: FontWeight.w100,
      fontFamily: 'Montserrat',
   );
   static const textStyle12 = TextStyle(
       color: ColorManager.primaryColor,
       fontSize: 12,
       fontWeight: FontWeight.normal,
      fontFamily: 'Montserrat',
     overflow: TextOverflow.ellipsis
   );
   static const textStyle16 = TextStyle(
     overflow: TextOverflow.ellipsis,
       color: ColorManager.secondaryColor,
       fontSize: 16,
       fontWeight: FontWeight.w200,
      fontFamily: 'Montserrat',
   );
   static const textStyle14 = TextStyle(
       color: ColorManager.originalWhite,
       fontSize: 14,
       fontWeight: FontWeight.bold,
      fontFamily: 'Montserrat',
     overflow: TextOverflow.ellipsis
   );
   static const textStyle14Primary = TextStyle(
       color: ColorManager.primaryColor,
       fontSize: 14,
       fontWeight: FontWeight.w200,
      fontFamily: 'Montserrat',
   );

   static const textStyle26 = TextStyle(
       color: ColorManager.secondaryColor,
       fontSize: 26,
       fontWeight: FontWeight.normal,
      fontFamily: 'Montserrat',
   );
}