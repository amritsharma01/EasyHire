import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/app_colors.dart';

class Mycard extends StatelessWidget {
  const Mycard(
      {super.key,
      required this.child,
      this.color,
      this.radius = 20,
      this.borderColor = AppColors.transparent,
      this.margin});

  final Widget child;
  final Color? color;
  final double radius;
  final Color borderColor;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: color ?? Theme.of(context).cardColor,
        elevation: 0,
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 9).r,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(radius.r))),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1).r,
            child: child));
  }
}
