import 'package:easyhire_app/core/extensions/color_extensions.dart';

import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/core/core_service_providers.dart';
import 'package:easyhire_app/core/utils/app_icons.dart';
import 'package:easyhire_app/features/auth/presentation/providers/auth_dependency_providers.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/buttonWidgets/button.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/textWidgets/app_text.dart';
import 'package:easyhire_app/features/auth/presentation/pages/appearance.dart';
import 'package:easyhire_app/features/user/presentation/provider/user_dependency_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/services/get.dart';
import '../../../auth/presentation/widgets/buttonWidgets/appicon.dart';
import '../widgets/app_list_tile.dart';
import '../widgets/card.dart';
import 'profile_page.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformScaffold(
        appBar: PlatformAppBar(title: const AppText('Settings & Privacy')),
        body: ListView(
            physics: Get.scrollPhysics,
            padding: EdgeInsets.zero,
            children: [
              _subtitle('Account'),
              Mycard(
                  child: Column(
                children: [
                  _settinglisttile(
                    title: 'Personal Details',
                    icon: AppIcons.person,
                    onTap: () {
                      Get.to(ProfilePage());
                    },
                  ),
                ],
              )),
              _subtitle('Content & Display'),
              Mycard(
                  child: Column(
                children: [
                  // _settinglisttile(
                  //     title: 'Notification',
                  //     icon: Get.notification,
                  //     onTap: () => Get.to(const NotificationPage())),
                  // _settinglisttile(
                  //     title: 'Clear Cache',
                  //     icon: Get.delete,
                  //     onTap: () async {
                  //       imageCache.clear();
                  //       imageCache.clearLiveImages();
                  //       final box = ref.read(storageProvider);
                  //       final mySavedAccount =
                  //           await box.get(HiveKey.savedAccounts);
                  //       final mySelectedAccount =
                  //           await box.get(HiveKey.selectedAccount);
                  //       final apper = await box.get(HiveKey.appearence);
                  //       await box.clear();
                  //       await box.set(HiveKey.savedAccounts, mySavedAccount);
                  //       await box.set(
                  //           HiveKey.selectedAccount, mySelectedAccount);
                  //       await box.set(HiveKey.appearence, apper);
                  //       Get.toast("Cleared");
                  //     }),
                  _settinglisttile(
                      title: "Appearence",
                      icon: AppIcons.menu,
                      onTap: () {
                        Get.to(const AppearancePage());
                      }),

                  if (kDebugMode)
                    _settinglisttile(
                        title: 'Change Platform',
                        icon: Icons.mobile_friendly,
                        onTap: () {
                          if (platformProvider.value ==
                              PlatformStyle.Material) {
                            platformProvider.value = PlatformStyle.Cupertino;
                            Get.toast('Switching IOS View');
                            return;
                          }
                          platformProvider.value = PlatformStyle.Material;
                          Get.toast('Switching Android View');
                        }),
                  30.verticalSpace,
                  AppButton(
                    onTap: () async {
                      final loginNotifierProvider =
                          ref.read(loginProvider.notifier);
                      final logoutNotifierProvider =
                          ref.read(userNotifierProvider.notifier);
                      await loginNotifierProvider.logout();
                      await logoutNotifierProvider.clearUserProfile();
                      Get.snackbar("logged Out");
                    },
                    text: "Logout",
                    bgcolor: Colors.redAccent.o8,
                  )
                ],
              )),
            ]));
  }

  Widget _subtitle(title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8).r,
      child: AppText("\t\t$title", style: Get.bodyMedium.disabledO5.px14),
    );
  }

  Widget _settinglisttile(
      {required String title,
      required IconData icon,
      double size = 20,
      required VoidCallback onTap}) {
    return AppListTile(
        key: ValueKey(title),
        onTap: onTap,
        padding: const EdgeInsets.symmetric(vertical: 5).r,
        leading: AppIcon(icon, size: size, color: Get.disabledColor.o6),
        trailing: AppIcon(
          AppIcons.rightCheveron,
          color: Get.disabledColor.o6,
          size: size,
        ),
        titleStyle: Get.bodyLarge.px16,
        title: title);
  }
}
