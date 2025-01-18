import 'package:easyhire_app/core/extensions/double.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/services/get.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    super.key,
    this.color,
    this.size = 25,
    this.onTap,
    this.padding,
    this.onLongTap,
  });
  final IconData icon;
  final Color? color;
  final double size;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Skeleton.shade(
        child: Padding(
            key: Get.key(icon),
            padding: padding ?? const EdgeInsets.all(2).rt,
            child: GestureDetector(
              onTap: onTap,
              onLongPress: onLongTap,
              child: Icon(
                icon,
                color: color,
                size: size.st,
              ),
            )));
  }
}
