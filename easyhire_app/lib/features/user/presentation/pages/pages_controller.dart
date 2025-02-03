import 'package:easyhire_app/features/auth/presentation/pages/login_page.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/specialWidgets/progress_indicator.dart';
import 'package:easyhire_app/features/employerapp/presentation/pages/employer_page_controller.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/pages/jobseeker_page_controller.dart';
import 'package:easyhire_app/features/user/presentation/provider/user_dependency_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PagesController extends ConsumerWidget {
  const PagesController({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);

    return userState.when(error: (error, stackTrace) {
      return LoginPage();
    }, loading: () {
      return Center(child: AppProgressIndicator());
    }, data: (user) {
      if (user == null) {
        return LoginPage();
      } else if (user.isEmployer) {
        return EmployerPagesController();
      } else {
        return JobseekerPagesController();
      }
    });
  }
}
