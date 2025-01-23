import 'package:easyhire_app/core/extensions/border_radius.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/get.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';

class AppListTile extends StatelessWidget {
  const AppListTile(
      {super.key,
      required this.title,
      this.leading,
      this.subtitle,
      this.onTap,
      this.trailing,
      this.titleStyle,
      this.backgroundColor,
      this.contentPadding,
      this.radius = 10,
      this.padding});

  final dynamic title;
  final Widget? leading;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final double radius;
  @override
  Widget build(BuildContext context) {
    final titleWidget = title is Widget
        ? title
        : AppText(title.toString(),
            style: titleStyle ?? Get.bodyMedium.px16,
            maxLines: 1,
            overflow: TextOverflow.ellipsis);
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius).rt),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4).rt,
          elevation: 0,
          child: Padding(
            padding: contentPadding ?? EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (leading != null) leading!,
                15.horizontalGap,
                Expanded(
                  flex: 8,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: Get.width * 0.53),
                    child: subtitle != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [titleWidget, 2.verticalGap, subtitle!])
                        : titleWidget,
                  ),
                ),
                const Spacer(),
                if (trailing != null) trailing!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
