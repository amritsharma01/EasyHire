import 'package:easyhire_app/core/extensions/border_radius.dart';
import 'package:easyhire_app/core/extensions/double.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/buttonWidgets/appIcon.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/textWidgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../../core/configs/app_colors.dart';
import '../../../../../core/services/get.dart';
import '../specialWidgets/progress_indicator.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.bgcolor,
      this.transparentColor = true,
      this.radius = 10,
      this.textColor});
  final dynamic Function() onTap;
  final String text;
  final Color? bgcolor;
  final bool transparentColor;
  final Color? textColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    ValueNotifier notifier = ValueNotifier<bool>(false);
    Color? textcolor = textColor;

    Color? buttonColor = bgcolor;
    final textstyle = Get.bodyMedium.px14.copyWith(color: AppColors.white);
    if (transparentColor) {
      buttonColor = buttonColor ?? Get.primaryColor;
      textcolor = textcolor ?? Get.scaffoldBackgroundColor;
    } else {
      buttonColor = buttonColor ?? Get.primaryColor;
      textcolor = textcolor ?? Get.scaffoldBackgroundColor;
    }
    final border = BorderRadius.circular(radius).rt;
    return SizedBox(
      height: 40.ht,
      width: (Get.width - 60).wt,
      child: ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, loading, child) => AbsorbPointer(
          absorbing: loading,
          child: PlatformElevatedButton(
            onPressed: () async {
              notifier.value = true;
              try {
                await onTap.call();
              } catch (e) {
                notifier.value = false;
              }
              notifier.value = false;
            },
            color: buttonColor,
            material: (context, platform) => MaterialElevatedButtonData(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(borderRadius: border))),
            cupertino: (context, platform) => CupertinoElevatedButtonData(
                padding: EdgeInsets.zero,
                pressedOpacity: 0.7,
                originalStyle: true,
                borderRadius: border),
            child: loading
                ? SizedBox.square(
                    dimension: 15.ht,
                    child: ApprogressIndicator(key: key, color: textcolor))
                : AppText(text,
                    style: textstyle.copyWith(
                      color: textcolor,
                    ),
                    maxLines: 1),
          ),
        ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.style,
      this.padding});

  final String text;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
        onPressed: onPressed,
        padding: padding ?? const EdgeInsets.only(top: 10).rt,
        alignment: Alignment.topCenter,
        material: (context, platform) => MaterialTextButtonData(
            clipBehavior: Clip.hardEdge,
            style: ButtonStyle(splashFactory: NoSplash.splashFactory)),
        child: AppText(text, style: style ?? Get.bodyLarge.px14.primary));
  }
}

class AppIconButon extends StatelessWidget {
  const AppIconButon(
      {super.key,
      required this.icon,
      required this.title,
      this.color,
      this.iconColor,
      this.textColor,
      required this.onTap,
      this.border,
      this.padding});

  final dynamic icon;
  final String title;
  final Color? color;
  final Color? iconColor;
  final Color? textColor;
  final VoidCallback onTap;
  final double? padding;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    // return TextButton.icon(
    //   onPressed: onTap,
    //   icon: AppIcon(icon, size: 22, color: iconColor ?? textColor),
    //   label:
    //       AppText(title, style: Get.bodyMedium.px14.copyWith(color: textColor)),
    //   style: OutlinedButton.styleFrom(
    //       backgroundColor: color,
    //       // side: BorderSide(color: color ?? Get.primaryColor, width: 1.5),
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(const Radius.circular(10)).rt)),
    // );
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: border ??
                  Border.all(color: color ?? Get.primaryColor, width: 1.5),
              color: color,
              borderRadius: BorderRadius.circular(10).rt),
          child: Padding(
            padding: EdgeInsets.all(padding ?? 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon(
                  icon,
                  size: 22,
                  color: iconColor,
                  padding: EdgeInsets.zero,
                ),
                4.horizontalGap,
                AppText(
                  title,
                  style: Get.bodyMedium.px14.copyWith(color: textColor),
                )
              ],
            ),
          ),
        ));
  }
}
