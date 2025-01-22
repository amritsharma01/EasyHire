import 'package:easyhire_app/features/jobseekerapp/presentation/pages/jobseeker_homepage.dart';
import 'package:easyhire_app/features/user/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/get.dart';
import '../../../../core/utils/app_icons.dart';
import '../providers/jobs_dependency_provider.dart';
import 'applied_jobs_page.dart';

class JobseekerPagesController extends ConsumerStatefulWidget {
  const JobseekerPagesController({super.key});

  @override
  ConsumerState<JobseekerPagesController> createState() =>
      _JobseekerPagesControllerState();
}

class _JobseekerPagesControllerState
    extends ConsumerState<JobseekerPagesController> {
  int _selectedIndex = 0;

  final List<Widget> _screens = <Widget>[
    const JobseekerHomepage(),
    const AppliedJobsPage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    final jobState = ref.read(jobNotifierProvider.notifier);
    final appliedJobsState = ref.read(appliedjobsNotifierProvider.notifier);
    jobState.fetchJobs();
    appliedJobsState.fetchJobs();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: _screens[_selectedIndex],
      bottomNavBar: PlatformNavBar(
        currentIndex: _selectedIndex,
        itemChanged: _onItemTapped,
        material: (_, __) => MaterialNavBarData(
          backgroundColor: Get.scaffoldBackgroundColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(AppIcons.work),
              label: 'Jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.application),
              label: 'applications',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.setting),
              label: 'Settings',
            ),
          ],
        ),
        cupertino: (_, __) => CupertinoTabBarData(
          backgroundColor: Get.scaffoldBackgroundColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(AppIcons.work),
              label: 'Jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.application),
              label: 'Applications',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.setting),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
