import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/buttonWidgets/appicon.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/textWidgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_icons.dart';

class PostedJobsPage extends StatelessWidget {
  const PostedJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: false,
        title: AppText("All Posted Jobs"),
        trailingActions: [
          AppIcon(
            AppIcons.notification,
            size: 18.sp,
          ),
          10.horizontalGap,
          AppIcon(
            AppIcons.search,
            size: 18.sp,
          ),
          10.horizontalGap,
        ],
      ),
      body: Text("Jobs"),
    );
  }
}
