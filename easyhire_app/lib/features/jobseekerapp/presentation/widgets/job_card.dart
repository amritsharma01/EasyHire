import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/buttonWidgets/button.dart';
import 'package:easyhire_app/features/employerapp/presentation/pages/application_received_page.dart';
import 'package:easyhire_app/features/employerapp/presentation/providers/emp_dependency_providers.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/pages/apply_page.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/bookmark_icon.dart';
import 'package:easyhire_app/features/user/presentation/provider/user_dependency_providers.dart';
import 'package:easyhire_app/features/user/presentation/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_icons.dart';
import '../../../../core/services/get.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';

import '../../domain/entity/job_entity.dart';

class JobCard extends ConsumerWidget {
  final JobEntity job;
  const JobCard(this.job, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRole = ref.read(userNotifierProvider);
    return Mycard(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5).rt,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton.shade(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(job.title, style: Get.bodyLarge.px18),
                  userRole.value!.isJobseeker
                      ? BookmarkIcon(job)
                      : Icon(AppIcons.application),
                ],
              ),
            ),
            10.verticalSpace,
            AppText(
                userRole.value!.isJobseeker ? job.employerName : "(Your Post)",
                style: Get.bodyMedium.px10),
            10.verticalSpace,
            AppText(job.description,
                style: Get.bodySmall.px12.copyWith(color: Colors.grey)),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText('Salary: ${job.salary}',
                    style: Get.bodySmall.px12.copyWith(color: Colors.grey)),
                Skeleton.shade(
                    child: userRole.value!.isJobseeker
                        ? AppButton(
                            height: 30.ht,
                            width: 100.wt,
                            onTap: () async {
                              Get.to(JobApplyPage(job: job));
                            },
                            text: "Apply")
                        : AppButton(
                            height: 30.ht,
                            width: 120.wt,
                            onTap: () async {
                              final receivedAppState = ref
                                  .read(receivedAppnNotifierProvicer.notifier);

                              await receivedAppState.fetchApplications(job.id);
                              Get.to(ApplicationsReceivedPage());
                            },
                            text: "Applications"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
