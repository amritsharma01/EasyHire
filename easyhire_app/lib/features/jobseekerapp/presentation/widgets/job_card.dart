import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/edit_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/buttonWidgets/button.dart';
import 'package:easyhire_app/features/employerapp/presentation/pages/application_received_page.dart';
import 'package:easyhire_app/features/employerapp/presentation/providers/emp_dependency_providers.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/pages/apply_page.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/bookmark_icon.dart';
import 'package:easyhire_app/features/user/presentation/provider/user_dependency_providers.dart';
import 'package:easyhire_app/features/user/presentation/widgets/card.dart';

import 'package:easyhire_app/core/services/get.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';
import '../../domain/entity/job_entity.dart';
import '../pages/edit_job_page.dart';

class JobCard extends ConsumerWidget {
  final JobEntity job;
  const JobCard(this.job, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRole = ref.read(userNotifierProvider);

    return Mycard(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5).rt,
      child: Padding(
        padding: EdgeInsets.all(8).rt,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppText(
                    job.title,
                    style: Get.bodyLarge.px20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                userRole.value!.isJobseeker
                    ? BookmarkIcon(job)
                    : EditIcon(
                        ontap: () {
                          Get.to(EditJobPage());
                        },
                      )
              ],
            ),
            Row(
              children: [
                AppText(
                  job.location,
                  style: Get.bodySmall.px08.copyWith(color: Colors.blueGrey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            3.verticalSpace,
            Divider(
              height: 1,
            ),
            3.verticalSpace,
            AppText(
              userRole.value!.isJobseeker ? job.employerName : "(Your Post)",
              style: Get.bodyMedium.px14,
            ),
            AppText(
              job.description,
              style: Get.bodySmall.px12,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  'Rs ${job.salary}',
                  style: Get.bodySmall.px12.copyWith(
                    color: Colors.green[300],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Skeleton.shade(
                  child: userRole.value!.isJobseeker
                      ? AppButton(
                          height: 30.h,
                          width: 100.w,
                          onTap: () async {
                            Get.to(JobApplyPage(job: job));
                          },
                          text: "Apply",
                        )
                      : AppButton(
                          height: 30.h,
                          width: 110.w,
                          onTap: () async {
                            final receivedAppState =
                                ref.read(receivedAppnNotifierProvicer.notifier);
                            await receivedAppState.fetchApplications(job.id);
                            Get.to(ApplicationsReceivedPage());
                          },
                          text: "Applications",
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
