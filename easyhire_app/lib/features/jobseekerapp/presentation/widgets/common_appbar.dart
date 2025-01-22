import 'package:easyhire_app/core/extensions/color_extensions.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/get.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../auth/presentation/widgets/buttonWidgets/appicon.dart';
import 'notification_icon.dart';

AppBar commonAppBar(Widget title) {
  return AppBar(
    key: Get.key(title),
    title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5).rt, child: title),
    actions: [
      Center(child: const NotificationIcon()),
      15.horizontalGap,
      AppIcon(AppIcons.search,
          size: 18, onTap: () {}, color: Get.disabledColor.o5),
      15.horizontalGap
    ],
  );
}
