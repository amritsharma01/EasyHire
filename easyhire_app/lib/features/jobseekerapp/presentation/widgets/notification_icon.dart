import 'package:easyhire_app/core/extensions/color_extensions.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/get.dart';
import '../../../auth/presentation/widgets/buttonWidgets/appicon.dart';

class NotificationIcon extends ConsumerWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notiIcon = AppIcon(
      AppIcons.notification,
      key: Get.key(Get.brightness),
      size: 18,
      onTap: () {},
      color: Get.disabledColor.o5,
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        notiIcon,
        Positioned(
          top: -3.rt, // Adjust position to fine-tune the badge's placement
          right: -3.rt,
          child: Container(
            padding: EdgeInsets.all(4.rt),
            decoration: BoxDecoration(
              color: Get.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Text(
              "1",
              style: Get.bodyMedium.px10.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
