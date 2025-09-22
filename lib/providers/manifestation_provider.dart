import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManifestationProvider extends ChangeNotifier {
  List<Map<String, String>> _savedManifestations = [];
  String _dailyAffirmation =
      "I am attracting everything aligned with my highest good.";

  List<Map<String, String>> get savedManifestations => _savedManifestations;
  String get dailyAffirmation => _dailyAffirmation;

  ManifestationProvider() {
    _loadManifestations();
  }

  Future<void> _loadManifestations() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getStringList('manifestations') ?? [];
    _savedManifestations = jsonData
        .map((e) => Map<String, String>.from(json.decode(e)))
        .toList();
    notifyListeners();
  }

  Future<void> saveManifestation(String manifest, String gratitude) async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final entry = {
      "manifest": manifest,
      "gratitude": gratitude,
      "time":
          "${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute.toString().padLeft(2, '0')}",
    };

    _savedManifestations.add(entry);
    final jsonList = _savedManifestations.map((e) => json.encode(e)).toList();
    await prefs.setStringList('manifestations', jsonList);
    notifyListeners();
  }

  Future<void> deleteSingleManifestation(int index) async {
    if (index >= 0 && index < _savedManifestations.length) {
      _savedManifestations.removeAt(index);
      final prefs = await SharedPreferences.getInstance();
      final jsonList = _savedManifestations.map((e) => json.encode(e)).toList();
      await prefs.setStringList('manifestations', jsonList);
      notifyListeners();
    }
  }

  Future<void> clearManifestations() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('manifestations');
    _savedManifestations.clear();
    notifyListeners();
  }

  void setDailyAffirmation(String affirmation) {
    _dailyAffirmation = affirmation;
    notifyListeners();
  }
}
