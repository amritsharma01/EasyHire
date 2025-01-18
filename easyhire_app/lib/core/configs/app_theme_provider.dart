import 'package:flutter/material.dart';

import '../../abstractservices/storage_services.dart';

import '../services/storage_services/hive_keys.dart';

class ThemeProvider extends ChangeNotifier {
  final _themes = [ThemeMode.light, ThemeMode.dark, ThemeMode.system];
  ThemeMode themeMode = ThemeMode.light;
  int index = 0;
  final StorageServices box;
  ThemeProvider(this.box);

  Future<ThemeProvider> init() async {
    index = await box.get(StorageKeys.appearence) ?? 0;
    themeMode = _themes[index];
    return this;
  }

  void toggleTheme(int ind) async {
    index = ind;
    box.set(StorageKeys.appearence, index);
    themeMode = _themes[index];
    notifyListeners();
  }
}
