import 'package:easyhire_app/core/configs/app_theme.dart';
import 'package:easyhire_app/core/services/get.dart';
import 'package:easyhire_app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/configs/app_colors.dart';
import 'core/configs/app_theme_provider.dart';
import 'core/core_service_providers.dart';
import 'features/jobseekerapp/presentation/providers/bookmark_notifier.dart';
import 'features/jobseekerapp/presentation/providers/jobs_dependency_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  final box = await Get.box.init();
  final themeProvider = await ThemeProvider(box).init();
  final bookMarkNotifier = await BookmarkNotifier(box).init();

  runApp(ProviderScope(overrides: [
    storageServiceProvider.overrideWith((ref) => box),
    themeModeProvider.overrideWith((ref) => themeProvider),
    bookmarkNotifierProvider.overrideWith((ref) => bookMarkNotifier)
  ], child: Core()));
}

class Core extends ConsumerWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    return ScreenUtilInit(
        key: Get.key("EasyHire"),
        minTextAdapt: true,
        ensureScreenSize: true,
        splitScreenMode: true,
        designSize: Size(360, 640),
        child: ValueListenableBuilder(
          valueListenable: platformProvider,
          builder: (context, platform, child) => PlatformProvider(
            key: Get.key(platform),
            settings: PlatformSettingsData(
                iosUsesMaterialWidgets: true,
                matchMaterialCaseForPlatformText: false,
                legacyIosUsesMaterialWidgets: true,
                iosUseZeroPaddingForAppbarPlatformIcon: true,
                platformStyle: PlatformStyleData(android: platform)),
            builder: (context) => PlatformTheme(
                themeMode: mode.themeMode,
                materialLightTheme: AppThemes.lightTheme,
                materialDarkTheme: AppThemes.darkTheme,
                cupertinoDarkTheme: AppThemes.iosdarkTheme,
                cupertinoLightTheme: AppThemes.ioslightTheme,
                builder: (context) => PlatformApp(
                    key: Get.key(mode.themeMode),
                    debugShowCheckedModeBanner: false,
                    navigatorKey: navigatorKey,
                    scrollBehavior: Get.scrollBehaviour,
                    color: AppColors.primary,
                    localizationsDelegates: const <LocalizationsDelegate<
                        dynamic>>[
                      DefaultMaterialLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate,
                      DefaultWidgetsLocalizations.delegate
                    ],
                    home: const LoginPage())),
          ),
        ));
  }
}
