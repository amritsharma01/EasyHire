import 'package:easyhire_app/core/configs/app_colors.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/core/utils/app_icons.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/textWidgets/app_text.dart';
import 'package:easyhire_app/features/employerapp/presentation/pages/jobs_post_page.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/common_appbar.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/job_card.dart';
import 'package:easyhire_app/features/user/presentation/widgets/error_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/services/get.dart';
import '../../../auth/presentation/widgets/buttonWidgets/appicon.dart';
import '../../../jobseekerapp/presentation/widgets/job_card_loading.dart';
import '../providers/emp_dependency_providers.dart';

class EmployerHomepage extends ConsumerWidget {
  const EmployerHomepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final empfetchJoblist = ref.watch(empjobNotifierProvider);

    Future<void> refreshJobList() async {
      ref.invalidate(empjobNotifierProvider);
    }

    return Scaffold(
      appBar: commonAppBar(
        AppText("All Posted Jobs"),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.to(
            JobsPostPage(),
          );
        },
        child: Container(
            width: 120.wt,
            height: 35.ht,
            decoration: ShapeDecoration(
              color: Get.scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.primary, width: 2.wt),
                borderRadius: BorderRadius.circular(30).r,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Center(
                child: Row(
                  children: [
                    AppIcon(
                      AppIcons.add,
                      color: Get.primaryColor,
                    ),
                    3.horizontalGap,
                    AppText(
                      "Post Job",
                      style:
                          Get.bodySmall.copyWith(color: Get.primaryColor).w800,
                    )
                  ],
                ),
              ),
            )),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: refreshJobList,
        child: empfetchJoblist.when(
          loading: () {
            return ListView.builder(
              physics: Get.scrollPhysics,
              itemCount: 5,
              itemBuilder: (context, index) => JobCardLoading(),
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: ErrorButton(
                provider: empjobNotifierProvider,
              ),
            );
          },
          skipLoadingOnRefresh: false,
          data: (jobList) {
            return jobList.isEmpty
                ? AppText("No Posted Jobs, Start by adding Some")
                : ListView.builder(
                    physics: Get.scrollPhysics,
                    itemCount: jobList.length,
                    itemBuilder: (context, index) => JobCard(jobList[index]!),
                  );
          },
        ),
      ),
    );
  }
}
