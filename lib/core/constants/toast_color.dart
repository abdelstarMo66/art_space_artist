import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color chooseToastColor(ToastState state) {
  Color? color;
  switch(state)
  {
    case ToastState.success:
       color = Colors.green;
    case ToastState.error:
      color = Colors.red;
    case ToastState.warning:
      color = Colors.amber;
  }
  return color;
}

void showToast({required String msg, required ToastState state}) => Fluttertoast.showToast(
  msg: msg,
  backgroundColor: chooseToastColor(state),
  fontSize: 16,
  gravity: ToastGravity.BOTTOM,
  textColor: ColorManager.originalWhite,
  timeInSecForIosWeb: 5
);