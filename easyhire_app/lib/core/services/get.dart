import 'dart:io';

import 'package:easyhire_app/core/services/messenger_services/messenger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:path_provider/path_provider.dart';

import '../../abstractservices/storage_services.dart';
import '../configs/app_colors.dart';
import '../core_service_providers.dart';
import 'storage_services/hive_keys.dart';
import 'storage_services/hive_storage_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
typedef Router = Future<Object?>;

abstract final class Get {
//Application State lai easily access garna sabai thau bata
  static NavigatorState get _currentState => navigatorKey.currentState!;
  static BuildContext get context => _currentState.context;

//dimentions easily access garna ko laagi
  static Size get size => MediaQuery.sizeOf(context);
  static double get width => size.width;
  static double get height => size.height;

//constant
  static String baseUrl = "https://qrhs13ph-8000.inc1.devtunnels.ms/";

  static Future<Directory> get directory async =>
      await getApplicationDocumentsDirectory();

// Toast message haru show garna ko laagi
  static snackbar(String message, {Color? color}) =>
      Meta.showMessenger(message, color: color);
  static banner(String message, {Color? color}) =>
      Meta.showBanner(message, color: color);
  static toast(String message, {Color? color}) =>
      Meta.showToast(message, color: color);

//Platform Specific scrolling haru garna ko laagi
  static bool get isIOS => platformProvider.value == PlatformStyle.Cupertino;
  static ScrollPhysics get scrollPhysics =>
      isIOS ? const BouncingScrollPhysics() : const ClampingScrollPhysics();
  static ScrollBehavior get scrollBehaviour =>
      isIOS ? const CupertinoScrollBehavior() : const MaterialScrollBehavior();
  static TextSelectionControls get selectionControl => isIOS
      ? CupertinoTextSelectionControls()
      : MaterialTextSelectionControls();

//Navigation ko lagi, push,pop, pushreplacement and pushandremoveuntil
  static Router to(Widget page) => _currentState
      .push(platformPageRoute(context: context, builder: (_) => page));
  static Router off(Widget page) => _currentState.pushReplacement(
      platformPageRoute(context: context, builder: (_) => page));
  static Router offAll(Widget page) => _currentState.pushAndRemoveUntil(
      platformPageRoute(context: context, builder: (_) => page),
      (Route<dynamic> route) => false);
  static dynamic pop() => _currentState.pop();

// Storage
  static StorageServices get box =>
      HiveStorageService(boxName: StorageKeys.boxName);

//Theme
  static ThemeData get _theme => Theme.of(context);
  static TextTheme get _textTheme => _theme.textTheme;

//Screen Brightness
  static Brightness get brightness => _theme.brightness;
  static bool get isDark => brightness == Brightness.dark;

//Theme TextStyles
  static TextStyle get bodyLarge => _textTheme.bodyLarge!;
  static TextStyle get bodyMedium => _textTheme.bodyMedium!;
  static TextStyle get bodySmall => _textTheme.bodySmall!;

//Theme Colors
  static Color get scaffoldBackgroundColor =>
      isIOS ? _iosScaffoldColor : _theme.scaffoldBackgroundColor;
  static Color get unselectedWidgetColor => _theme.unselectedWidgetColor;
  static Color get disabledColor => _theme.disabledColor;
  static Color get primaryColor => _theme.primaryColor;
  static Color get cardColor => _theme.cardColor;

  static Color get _iosScaffoldColor =>
      isDark ? AppColors.iosBlack : AppColors.iosWhite;

//locale
  static String get local => Localizations.localeOf(context).toString();

//permissions

//Keys (idenatifies widgets based on values)
  static Key key(dynamic value) => ValueKey(value ?? uniqueKey.toString());
  static Key get uniqueKey => UniqueKey();
  static Key pageStoregeKey(dynamic value) => PageStorageKey(value);
}
