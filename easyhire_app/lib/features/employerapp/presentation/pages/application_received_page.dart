import 'package:easyhire_app/core/extensions/color_extensions.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/specialWidgets/progress_indicator.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/textWidgets/app_text.dart';
import 'package:easyhire_app/features/employerapp/presentation/widgets/received_appn_card.dart';
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
          return Center(
              child: AppText("No one applied for this job till now!"));
        } else {
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              ref.invalidate(receivedAppnNotifierProvicer);
            },
            child: ListView.builder(
                physics: Get.scrollPhysics,
                itemCount: appnlist.length,
                itemBuilder: (context, index) {
                  return ReceivedAppnCard(
                      jobTitle: appnlist[index]!.jobTitle,
                      userName: appnlist[index]!.userName,
                      userEmail: appnlist[index]!.userEmail,
                      cvLetter: appnlist[index]!.cvLetter);
                }),
          );
        }
      }),
    );
  }
}
