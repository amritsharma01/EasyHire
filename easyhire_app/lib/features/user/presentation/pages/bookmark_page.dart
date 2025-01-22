import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/presentation/widgets/textWidgets/app_text.dart';
import '../../../jobseekerapp/presentation/providers/jobs_dependency_provider.dart';

class BookmarkPage extends ConsumerWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkNotifier = ref.watch(bookmarkNotifierProvider);
    return PlatformScaffold(
      appBar: PlatformAppBar(title: AppText("Bookmarked Jobs")),
      body: ListView.builder(
          itemCount: bookmarkNotifier.jobList.length,
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10).r,
          itemBuilder: (context, index) {
            return JobCard(bookmarkNotifier.jobList[index]);
          }),
    );
  }
}
