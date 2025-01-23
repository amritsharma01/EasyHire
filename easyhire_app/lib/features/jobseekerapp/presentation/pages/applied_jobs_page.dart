import 'package:easyhire_app/core/extensions/color_extensions.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/specialWidgets/progress_indicator.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/providers/jobs_dependency_provider.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/common_appbar.dart';
import 'package:easyhire_app/features/user/presentation/widgets/app_list_tile.dart';
import 'package:easyhire_app/features/user/presentation/widgets/error_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/get.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../auth/presentation/widgets/buttonWidgets/appicon.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';

class AppliedJobsPage extends ConsumerWidget {
  const AppliedJobsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appliedJobsState = ref.watch(appliedjobsNotifierProvider);
    return Scaffold(
      appBar: commonAppBar(Text("All Applied Jobs")),
      body: appliedJobsState.when(
        error: (error, stackTrace) {
          return ErrorButton(
            provider: appliedjobsNotifierProvider,
          );
        },
        loading: () {
          return AppProgressIndicator();
        },
        data: (appliedjobs) => Column(
          children: [
            5.verticalGap,
            ListView.builder(
              itemCount: appliedjobs.length,
              shrinkWrap: true,
              physics: Get.scrollPhysics,
              itemBuilder: (context, index) {
                return AppListTile(
                  radius: 30,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10).rt,
                  title: AppText(
                    appliedjobs[index]!.jobtitle,
                    style: Get.bodyLarge,
                  ),
                  subtitle:
                      Text("Cover Letter : ${appliedjobs[index]!.cvLetter}"),
                  trailing: AppIcon(
                    AppIcons.tick,
                    size: 28,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
