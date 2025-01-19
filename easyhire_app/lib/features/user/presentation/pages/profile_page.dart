import 'package:easyhire_app/features/user/presentation/provider/user_dependency_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userNotifierProvider).user!;

    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text("Profile"),
        ),
        body: Column(
          children: [Text(user.email), Text(user.name)],
        ));
  }
}
