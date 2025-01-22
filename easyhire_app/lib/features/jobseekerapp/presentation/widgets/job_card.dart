import 'package:easyhire_app/core/extensions/color_extensions.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/buttonWidgets/button.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/pages/apply_page.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/bookmark_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/configs/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../core/services/get.dart';
import '../../../auth/presentation/widgets/buttonWidgets/appIcon.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';

import '../../domain/entity/job_entity.dart';

class JobCard extends StatelessWidget {
  final JobEntity job;
  const JobCard(this.job, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10).rt,
      padding: EdgeInsets.all(10).rt,
      decoration: BoxDecoration(
          color: Get.disabledColor.o1,
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(20).r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton.shade(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(job.title, style: Get.bodyLarge.px18),
                BookmarkIcon(job),
              ],
            ),
          ),
          10.verticalSpace,
          AppText(job.description, style: Get.bodyMedium.px14),
          10.verticalSpace,
          AppText('Employer: ${job.employer}',
              style: Get.bodySmall.px12.copyWith(color: Colors.grey)),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText('Salary: ${job.salary}',
                  style: Get.bodySmall.px12.copyWith(color: Colors.grey)),
              Skeleton.shade(
                child: AppButton(
                    height: 30.ht,
                    width: 80.wt,
                    onTap: () {
                      Get.to(JobApplyPage(job: job));
                    },
                    text: "Apply"),
              )
            ],
          ),
          10.verticalSpace,
          AppText('Posted: ${job.id}',
              style: Get.bodySmall.px12.copyWith(color: Colors.grey)),
        ],
      ),
    );
  }
}
