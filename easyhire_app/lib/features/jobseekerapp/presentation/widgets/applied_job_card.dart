import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/features/user/presentation/widgets/card.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/get.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';
import '../../../auth/presentation/widgets/buttonWidgets/appicon.dart';

class AppliedJobCard extends StatelessWidget {
  final String title;
  final String coverLetter;
  final VoidCallback onTap;

  const AppliedJobCard({
    super.key,
    required this.title,
    required this.coverLetter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Mycard(
        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10).rt,
        radius: 20,
        child: Padding(
          padding: EdgeInsets.all(10).rt,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    title,
                    style: Get.bodyLarge.bold.px18,
                  ),
                  AppIcon(
                    AppIcons.tick,
                    size: 28,
                    color: Get.primaryColor,
                  ),
                ],
              ),
              SizedBox(height: 8),
              AppText(
                "Cover Letter: $coverLetter",
                style: Get.bodySmall,
                maxLines: 2,
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
