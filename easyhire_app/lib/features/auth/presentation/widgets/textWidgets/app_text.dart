import 'package:auto_size_text/auto_size_text.dart';
import 'package:easyhire_app/core/extensions/double.dart';
import 'package:easyhire_app/core/services/get.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(this.text,
      {super.key,
      this.style,
      this.textAlign,
      this.maxLines,
      this.overflow = TextOverflow.ellipsis,
      this.textDirection,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.minFontSize = 14});
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDirection? textDirection;
  final double minFontSize;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: (style ?? Get.bodyMedium).copyWith(
          color: textColor, fontSize: fontSize?.st, fontWeight: fontWeight),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      textDirection: textDirection,
      minFontSize: 14,
      locale: Localizations.localeOf(context),
    );
  }
}
