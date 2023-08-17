import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    loadThemeMode();
  }

  toggleTheme() async {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
    await saveThemeMode();
  }

  Future<void> saveThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('themeMode', _themeMode.index);
  }

  Future<void> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    _themeMode = ThemeMode.values[prefs.getInt('themeMode') ?? 0];
    notifyListeners();
  }
}
