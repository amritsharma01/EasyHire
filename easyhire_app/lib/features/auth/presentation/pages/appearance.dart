import 'package:easyhire_app/core/extensions/color_extensions.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core_service_providers.dart';
import '../../../../core/services/get.dart';
import '../widgets/textWidgets/app_text.dart';

final listAppearence = ['Light Mode', 'Dark Mode', 'System Default'];

class AppearancePage extends ConsumerWidget {
  const AppearancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apper = ref.watch(themeModeProvider);
    return PlatformScaffold(
      appBar: PlatformAppBar(title: const AppText("Appearence")),
      body: Padding(
        padding: const EdgeInsets.all(8.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.verticalGap,
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 25).r,
              itemCount: listAppearence.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 5).r,
                  child: GestureDetector(
                    onTap: () => apper.toggleTheme(index),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 10.r,
                          backgroundColor: Get.disabledColor.o3,
                          child: CircleAvatar(
                              radius: 8.5.r,
                              backgroundColor: (apper.index) == index
                                  ? Get.primaryColor
                                  : Get.scaffoldBackgroundColor),
                        ),
                        30.horizontalGap,
                        AppText(listAppearence[index],
                            style: Get.bodyLarge.px18)
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
