import 'package:flutter/material.dart';
import 'package:manifest_app/providers/manifestation_provider.dart';
import 'package:manifest_app/providers/theme_provider.dart';
import 'package:manifest_app/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ManifestationProvider()),
      ],
      child: const ManifestationApp(),
    ),
  );
}

class ManifestationApp extends StatelessWidget {
  const ManifestationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Manifestation App',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentTheme,
          home: const ManifestationHomePage(),
        );
      },
    );
  }
}
