import 'package:flutter/material.dart';
import 'package:manifest_app/screens/home.dart';

void main() {
  runApp(const ManifestationApp());
}

class ManifestationApp extends StatefulWidget {
  const ManifestationApp({super.key});

  @override
  State<ManifestationApp> createState() => _ManifestationAppState();
}

class _ManifestationAppState extends State<ManifestationApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manifestation App',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode
          ? ThemeData.dark()
          : ThemeData(primarySwatch: Colors.purple),
      home: ManifestationHomePage(
        toggleTheme: () => setState(() => isDarkMode = !isDarkMode),
        isDarkMode: isDarkMode,
      ),
    );
  }
}
