import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/buttonWidgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/configs/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../core/services/get.dart';
import '../../../auth/presentation/widgets/buttonWidgets/appIcon.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';

class JobCardLoading extends StatelessWidget {
  const JobCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10).rt,
        padding: EdgeInsets.all(10).rt,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(20).r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("jsdhfljkahj", style: Get.bodyLarge.px18),
                AppIcon(
                  AppIcons.bookmark,
                  size: 18,
                ),
              ],
            ),
            10.verticalSpace,
            AppText("sdajkfhfajdfklf", style: Get.bodyMedium.px14),
            10.verticalSpace,
            AppText('Employer: djasjkjdknaj',
                style: Get.bodySmall.px12.copyWith(color: Colors.grey)),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText('Salary: 122432',
                    style: Get.bodySmall.px12.copyWith(color: Colors.grey)),
                AppButton(
                    height: 30.ht, width: 80.wt, onTap: () {}, text: "Apply")
              ],
            ),
            // 10.verticalSpace,
            // AppText('Posted: ${job.createdAt}',
            //     style: Get.bodySmall.px12.copyWith(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
