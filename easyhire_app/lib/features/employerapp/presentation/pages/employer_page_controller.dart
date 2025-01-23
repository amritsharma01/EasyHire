import 'package:easyhire_app/features/employerapp/presentation/pages/employer_homepage.dart';
import 'package:easyhire_app/features/user/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/get.dart';
import '../../../../core/utils/app_icons.dart';
import '../providers/emp_dependency_providers.dart';

class EmployerPagesController extends ConsumerStatefulWidget {
  const EmployerPagesController({super.key});

  @override
  ConsumerState<EmployerPagesController> createState() =>
      _EmployerPagesControllerState();
}

class _EmployerPagesControllerState
    extends ConsumerState<EmployerPagesController> {
  int _selectedIndex = 0;

  final List<Widget> _screens = <Widget>[
    EmployerHomepage(),
    SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    final empjobState = ref.read(empjobNotifierProvider.notifier);

    empjobState.fetchJobs();
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
              icon: Icon(AppIcons.person),
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
              icon: Icon(AppIcons.person),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
