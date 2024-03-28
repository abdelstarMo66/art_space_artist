import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';

void logError(String msg) => debugPrint(
      '\x1B[31m$msg\x1B[0m',
    );

void logSuccess(String msg) => debugPrint(
      '\x1B[32m$msg\x1B[0m',
    );

void logWarning(String msg) => debugPrint(
      '\x1B[33m$msg\x1B[0m',
    );

extension StringExtension on String {
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }

  Future<void> toToastError() async {
    try {
      final message = isEmpty ? "error" : this;

      await Fluttertoast.cancel();

      showToast(message, ToastState.error);
    } catch (e) {
      logError("toToastError error $e");
    }
  }

  Future<void> toToastSuccess() async {
    try {
      final message = isEmpty ? "success" : this;

      await Fluttertoast.cancel();

      showToast(message, ToastState.success);
    } catch (e) {
      logError("toToastSuccess error: $e");
    }
  }

  Future<void> toToastWarning() async {
    try {
      final message = isEmpty ? "warning" : this;

      await Fluttertoast.cancel();

      showToast(message, ToastState.warning);
    } catch (e) {
      logError("toToastWarning error: $e");
    }
  }
}

showToast(String text, ToastState state) async {
  await Fluttertoast.cancel();
  final backgroundColor = state == ToastState.success
      ? Colors.green
      : state == ToastState.error
          ? Colors.red
          : Colors.yellow;
  final textColor = state == ToastState.success
      ? Colors.white
      : state == ToastState.error
          ? Colors.white
          : Colors.black;
  Fluttertoast.showToast(
    msg: text,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16,
    backgroundColor: backgroundColor,
    textColor: textColor,
  );
}

//TODO add common method used in multiple screens or views or even widgets
