import 'package:first_app/bloc/theme_bloc/theme_service.dart';
import 'package:flutter/material.dart';

class ThemeController with ChangeNotifier {
  ThemeController(this._themeService);

  final ThemeService _themeService;

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  Future<void> loadSettings() async {
    _themeMode = await _themeService.themeMode();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();

    await _themeService.updateThemeMode(newThemeMode);
  }
}
