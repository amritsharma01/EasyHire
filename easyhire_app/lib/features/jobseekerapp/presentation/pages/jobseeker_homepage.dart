import 'package:easyhire_app/features/auth/presentation/widgets/textWidgets/app_text.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/providers/jobs_dependency_provider.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/common_appbar.dart';

import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/job_card.dart';

import 'package:easyhire_app/features/user/presentation/widgets/error_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/get.dart';
import '../widgets/job_card_loading.dart';

class JobseekerHomepage extends ConsumerWidget {
  const JobseekerHomepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchJoblist = ref.watch(jobNotifierProvider);
    return Scaffold(
      appBar: commonAppBar(
        AppText("All Available Jobs"),
      ),
      body: fetchJoblist.when(
        loading: () {
          return ListView.builder(
              shrinkWrap: true,
              physics: Get.scrollPhysics,
              itemCount: 8,
              itemBuilder: (context, index) => JobCardLoading());
        },
        error: (error, stackTrace) {
          return ErrorButton(
            provider: jobNotifierProvider,
          );
        },
        skipLoadingOnRefresh: false,
        data: (jobList) {
          return ListView.builder(
              shrinkWrap: true,
              physics: Get.scrollPhysics,
              itemCount: jobList.length,
              itemBuilder: (context, index) => JobCard(jobList[index]!));
        },
      ),
    );
  }
}
