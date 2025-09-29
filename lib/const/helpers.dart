import 'package:flutter/material.dart';
import 'package:manifest_app/providers/theme_provider.dart';

IconData getThemeIcon(ThemeProvider themeProvider) {
  switch (themeProvider.currentThemeMode) {
    case 'system':
      return Icons.brightness_auto;
    case 'light':
      return Icons.light_mode;
    case 'dark':
      return Icons.dark_mode;
    default:
      return Icons.brightness_auto;
  }
}

void handleThemeChange(String value, ThemeProvider themeProvider) {
  switch (value) {
    case 'system':
      themeProvider.setSystemTheme();
      break;
    case 'light':
      themeProvider.setLightMode();
      break;
    case 'dark':
      themeProvider.setDarkMode();
      break;
  }
}
