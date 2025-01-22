import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/features/user/presentation/provider/user_dependency_providers.dart';
import 'package:easyhire_app/features/user/presentation/widgets/error_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/widgets/textWidgets/app_text.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: AppText(
          "Profile",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).rt,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            userState.when(data: (user) {
              return Column(
                children: [
                  ProfileDetailRow(
                    icon: Icons.person,
                    label: "Name",
                    value: user!.name,
                  ),
                  ProfileDetailRow(
                    icon: Icons.email,
                    label: "Email",
                    value: user.email,
                  ),
                  ProfileDetailRow(
                    icon: Icons.work,
                    label: "Role",
                    value: user.isEmployer ? "Employer" : "Jobseeker",
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
          ],
        ),
      ),
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
