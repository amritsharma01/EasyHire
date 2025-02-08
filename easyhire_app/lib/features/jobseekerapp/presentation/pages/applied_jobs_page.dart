import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/applied_job_card.dart'; // Assuming the card is imported here
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/get.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';
import '../../../auth/presentation/widgets/specialWidgets/progress_indicator.dart';
import '../../../user/presentation/widgets/error_button.dart';
import '../providers/jobs_dependency_provider.dart';

class AppliedJobsPage extends ConsumerWidget {
  const AppliedJobsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appliedJobsState = ref.watch(appliedjobsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: AppText("All Applied Jobs", style: Get.bodyMedium),
        backgroundColor: Get.primaryColor,
      ),
      body: appliedJobsState.when(
        error: (error, stackTrace) {
          return ErrorButton(
            provider: appliedjobsNotifierProvider,
          );
        },
        loading: () {
          return const Center(child: AppProgressIndicator());
        },
        data: (appliedJobs) => RefreshIndicator.adaptive(
          onRefresh: () async {
            ref.invalidate(appliedjobsNotifierProvider);
          },
          child: ListView.builder(
            itemCount: appliedJobs.length,
            itemBuilder: (context, index) {
              final job = appliedJobs[index];
              return AppliedJobCard(
                title: job!.jobtitle,
                coverLetter: job.cvLetter,
                onTap: () {},
              );
            },
          ),
        ),
      ),
    );
  }
}
