import 'package:easyhire_app/core/extensions/color_extensions.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/get.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';
import '../../../user/presentation/widgets/card.dart';

class ReceivedAppnCard extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String jobTitle;
  final String cvLetter;
  const ReceivedAppnCard(
      {super.key,
      required this.jobTitle,
      required this.userName,
      required this.userEmail,
      required this.cvLetter});

  @override
  Widget build(BuildContext context) {
    return Mycard(
      radius: 20.r,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5).rt,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Get.primaryColor.o2,
              child: Icon(Icons.person, color: Get.primaryColor, size: 24.r),
            ),
            12.horizontalGap,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    userName,
                    style: Get.bodyMedium.w700,
                  ),
                  AppText(userEmail, style: Get.bodySmall.w500),
                  6.verticalGap,
                  Row(
                    children: [
                      Icon(Icons.work, size: 18.r, color: Get.primaryColor.o7),
                      5.horizontalGap,
                      Expanded(
                        child: AppText(
                          jobTitle,
                          style: Get.bodyMedium.w600,
                        ),
                      ),
                    ],
                  ),
                  8.verticalGap,
                  Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      color: Get.primaryColor.o1,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: AppText(
                      cvLetter,
                      style: Get.bodySmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis, // Avoid long overflow
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
