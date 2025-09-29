import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_preference';

  bool? _isDarkMode;
  bool _useSystemTheme = true;

  bool get isDarkMode {
    if (_useSystemTheme) {
      return _getSystemTheme();
    }
    return _isDarkMode ?? false;
  }

  bool get useSystemTheme => _useSystemTheme;

  ThemeProvider() {
    _loadThemePreference();
  }

  ThemeData get currentTheme {
    if (isDarkMode) {
      return ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        colorScheme: ColorScheme.dark(primary: Colors.purple),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          elevation: 0,
        ),
      );
    } else {
      return ThemeData.light().copyWith(
        primaryColor: Colors.purple,
        colorScheme: ColorScheme.light(primary: Colors.purple),
        appBarTheme: AppBarTheme(backgroundColor: Colors.purple, elevation: 0),
      );
    }
  }

  bool _getSystemTheme() {
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    return brightness == Brightness.dark;
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final themeValue = prefs.getString(_themeKey);

    if (themeValue == 'system') {
      _useSystemTheme = true;
    } else if (themeValue == 'dark') {
      _useSystemTheme = false;
      _isDarkMode = true;
    } else if (themeValue == 'light') {
      _useSystemTheme = false;
      _isDarkMode = false;
    } else {
      _useSystemTheme = true;
      await prefs.setString(_themeKey, 'system');
    }

    notifyListeners();
  }

  Future<void> setSystemTheme() async {
    _useSystemTheme = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, 'system');
    notifyListeners();
  }

  Future<void> setDarkMode() async {
    _useSystemTheme = false;
    _isDarkMode = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, 'dark');
    notifyListeners();
  }

  Future<void> setLightMode() async {
    _useSystemTheme = false;
    _isDarkMode = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, 'light');
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    if (_useSystemTheme) {
      await setDarkMode();
    } else if (_isDarkMode == true) {
      await setLightMode();
    } else {
      await setSystemTheme();
    }
  }

  String get currentThemeMode {
    if (_useSystemTheme) return 'system';
    return _isDarkMode == true ? 'dark' : 'light';
  }
}
