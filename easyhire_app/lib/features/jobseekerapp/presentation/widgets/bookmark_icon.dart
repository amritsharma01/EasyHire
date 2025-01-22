import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/get.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../domain/entity/job_entity.dart';
import '../providers/jobs_dependency_provider.dart';
import 'app_icon_button.dart';

class BookmarkIcon extends ConsumerWidget {
  const BookmarkIcon(this.job, {super.key});

  final JobEntity job;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkNotifier = ref.watch(bookmarkNotifierProvider);
    final isBookmarked =
        bookmarkNotifier.jobList.any((element) => element.id == job.id);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: AppIconButton(
        key: ValueKey(isBookmarked),
        isBookmarked ? AppIcons.bookmark : AppIcons.bookmarkOutlined,
        color: Get.disabledColor,
        onTap: () => bookmarkNotifier.update(job, isBookmarked),
      ),
    );
  }
}
