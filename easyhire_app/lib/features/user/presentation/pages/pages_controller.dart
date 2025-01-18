import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../employerapp/presentation/pages/employer_page_controller.dart';
import '../../../jobseekerapp/presentation/pages/jobseeker_page_controller.dart';
import '../provider/user_dependency_providers.dart';

class PagesController extends ConsumerWidget {
  const PagesController({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);

    return userState.when(
      data: (user) {
        // Check if the user is an employer or a jobseeker
        if (user.isEmployer) {
          return EmployerPagesController();
        } else {
          return JobseekerPagesController();
        }
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: Colors.blue),
      ),
      error: (error, stack) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}
