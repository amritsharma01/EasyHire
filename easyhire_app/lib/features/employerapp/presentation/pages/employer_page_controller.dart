import 'package:easyhire_app/features/employerapp/presentation/pages/posted_jobs_page.dart';
import 'package:easyhire_app/features/user/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../core/services/get.dart';
import '../../../../core/utils/app_icons.dart';
import 'applications_pages.dart';

class EmployerPagesController extends StatefulWidget {
  const EmployerPagesController({super.key});

  @override
  State<EmployerPagesController> createState() =>
      _EmployerPagesControllerState();
}

class _EmployerPagesControllerState extends State<EmployerPagesController> {
  int _selectedIndex = 0;

  final List<Widget> _screens = <Widget>[
    PostedJobsPage(),
    ApplicationsPages(),
    SettingsPage(),
  ];

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
              label: 'Application',
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
              icon: Icon(AppIcons.application),
              label: 'Application',
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
