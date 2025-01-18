import 'package:easyhire_app/core/services/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class Meta {
  static showBanner(String message, {Color? color}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: color ?? Colors.teal,
        textColor: Get.scaffoldBackgroundColor,
        fontSize: 16.0.sp);
  }

  static showMessenger(String message, {Color? color}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: color ?? Colors.red,
        textColor: Get.scaffoldBackgroundColor,
        fontSize: 16.0.sp);
  }

  static showToast(String message, {Color? color}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: color ?? Colors.grey,
        textColor: Get.scaffoldBackgroundColor,
        fontSize: 16.0.sp);
  }
}
