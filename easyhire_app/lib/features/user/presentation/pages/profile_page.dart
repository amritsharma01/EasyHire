import 'package:easyhire_app/features/user/presentation/provider/user_dependency_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userNotifierProvider);
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text("Profile"),
      ),
      body: profile.when(
        data: (user) {
          return Column(
            children: [
              Text(user.id),
              Text(user.name),
              Text(user.email),
              Text("Employer ho ra? ${user.isEmployer}"),
              Text("Jobseeker ho ra? ${user.isJobseeker}"),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: Colors.blue),
        ),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
