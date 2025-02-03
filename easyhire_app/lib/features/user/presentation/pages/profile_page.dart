import 'package:easyhire_app/core/extensions/color_extensions.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/features/user/presentation/provider/user_dependency_providers.dart';

import 'package:easyhire_app/features/user/presentation/widgets/error_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/get.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          title: AppText(
            "Profile",
          ),
        ),
        body: userState.when(data: (user) {
          return ListView(
            children: [
              10.verticalGap,
              Center(
                child: CircleAvatar(
                  backgroundColor: Get.primaryColor.o4,
                  radius: 90,
                ),
              ),
              10.verticalGap,
              AppText(
                user!.name,
                textAlign: TextAlign.center,
                style: Get.bodyLarge.titleColor.px20,
              ),
              3.verticalGap,
              AppText(
                user.email,
                textAlign: TextAlign.center,
                style: Get.bodySmall.px12,
              ),
              AppText(
                user.isJobseeker.toString(),
                textAlign: TextAlign.center,
                style: Get.bodySmall.px12,
              ),
              AppText(
                user.isEmployer.toString(),
                textAlign: TextAlign.center,
                style: Get.bodySmall.px12,
              ),
            ],
          );
        }, error: (error, stackTrace) {
          return ErrorButton(
            provider: userNotifierProvider,
          );
        }, loading: () {
          return CircularProgressIndicator.adaptive();
        })
        // Add more profile details here

        );
  }
}

class ProfileDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileDetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blueAccent,
          ),
          const SizedBox(width: 10),
          Text(
            "$label: ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
