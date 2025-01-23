import 'package:easyhire_app/core/extensions/color_extensions.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/specialWidgets/progress_indicator.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/textWidgets/app_text.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/entity/job_entity.dart';
import 'package:easyhire_app/features/user/presentation/widgets/card.dart';
import 'package:easyhire_app/features/user/presentation/widgets/error_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/get.dart';
import '../providers/emp_dependency_providers.dart';

class ApplicationsReceivedPage extends ConsumerWidget {
  const ApplicationsReceivedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receivedAppState = ref.read(receivedAppnNotifierProvicer);
    return Scaffold(
      appBar: AppBar(
        title: AppText("Applications Received"),
      ),
      body: receivedAppState.when(error: (error, stackTrace) {
        return ErrorButton(
          provider: receivedAppnNotifierProvicer,
        );
      }, loading: () {
        return AppProgressIndicator();
      }, data: (appnlist) {
        if (appnlist.isEmpty) {
          return AppText("No one applied for thi job");
        } else {
          return ListView.builder(
              itemCount: appnlist.length,
              itemBuilder: (context, index) {
                return Mycard(
                    radius: 30.r,
                    borderColor: Get.disabledColor,
                    color: Get.disabledColor.o1,
                    margin: EdgeInsets.all(5).rt,
                    child: Column(
                      children: [
                        AppText(appnlist[index]!.userName),
                        AppText(appnlist[index]!.userEmail),
                        AppText(appnlist[index]!.jobTitle),
                        AppText(appnlist[index]!.cvLetter),
                      ],
                    ));
              });
        }
      }),
    );
  }
}
