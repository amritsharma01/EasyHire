import 'package:easyhire_app/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../configs/app_colors.dart';
import '../services/get.dart';

extension SizeExtension on TextStyle {
  TextStyle get px10 => copyWith(fontSize: 10.sp);
  TextStyle get px11 => copyWith(fontSize: 11.sp);
  TextStyle get px12 => copyWith(fontSize: 12.sp);
  TextStyle get px13 => copyWith(fontSize: 13.sp);
  TextStyle get px14 => copyWith(fontSize: 14.sp);
  TextStyle get px15 => copyWith(fontSize: 15.sp);
  TextStyle get px16 => copyWith(fontSize: 16.sp);
  TextStyle get px17 => copyWith(fontSize: 17.sp);
  TextStyle get px18 => copyWith(fontSize: 18.sp);
  TextStyle get px19 => copyWith(fontSize: 19.sp);
  TextStyle get px20 => copyWith(fontSize: 20.sp);
  TextStyle get px21 => copyWith(fontSize: 21.sp);
  TextStyle get px22 => copyWith(fontSize: 22.sp);
  TextStyle get px23 => copyWith(fontSize: 23.sp);
  TextStyle get px24 => copyWith(fontSize: 24.sp);
  TextStyle get px25 => copyWith(fontSize: 25.sp);
  TextStyle get px26 => copyWith(fontSize: 26.sp);
  TextStyle get px27 => copyWith(fontSize: 27.sp);
  TextStyle get px28 => copyWith(fontSize: 28.sp);
  TextStyle get px29 => copyWith(fontSize: 29.sp);
  TextStyle get px30 => copyWith(fontSize: 30.sp);
  TextStyle get px31 => copyWith(fontSize: 31.sp);
  TextStyle get px32 => copyWith(fontSize: 32.sp);
  TextStyle get px33 => copyWith(fontSize: 33.sp);
  TextStyle get px34 => copyWith(fontSize: 34.sp);
  TextStyle get px35 => copyWith(fontSize: 35.sp);
  TextStyle get px36 => copyWith(fontSize: 36.sp);
  TextStyle get px37 => copyWith(fontSize: 37.sp);
  TextStyle get px38 => copyWith(fontSize: 38.sp);
  TextStyle get px39 => copyWith(fontSize: 39.sp);
  TextStyle get px40 => copyWith(fontSize: 40.sp);
  TextStyle get px15o5 => copyWith(fontSize: 15.5.sp);
}

extension Boldness on TextStyle {
  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);
}

extension Textcolor on TextStyle {
  TextStyle get primary => copyWith(color: Get.primaryColor);
  TextStyle get disabled => copyWith(color: Get.disabledColor);
  TextStyle get black => copyWith(color: AppColors.black);
  TextStyle get scaffoldBackground =>
      copyWith(color: Get.scaffoldBackgroundColor);
  TextStyle get disabledO5 => copyWith(color: Get.disabledColor.o5);
  TextStyle get primaryO6 => copyWith(color: Get.primaryColor.o6);
  TextStyle get white => copyWith(color: AppColors.white);

  TextStyle get titleColor => copyWith(color: AppColors.titleColor);
}

extension Styling on TextStyle {
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get h2 => copyWith(height: 2.h);
  TextStyle get h1 => copyWith(height: 1.h);
  TextStyle get h1o5 => copyWith(height: 1.5.h);
}
