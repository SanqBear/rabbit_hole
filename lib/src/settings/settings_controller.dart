import 'package:flutter/material.dart';
import 'package:rabbit_hole/src/module/http_request.dart';

import 'package:rabbit_hole/src/settings/settings.dart';

class SettingsController with ChangeNotifier {
  SettingsController(SettingsService settingsService) : _settingsService = settingsService;

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  // Make ThemeMode a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late ThemeMode _themeMode;
  late String _apiUrl;  

  // Allow Widgets to read the user's preferred ThemeMode.
  ThemeMode get themeMode => _themeMode;
  String get apiUrl => _apiUrl;

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _apiUrl = await _settingsService.apiUrl();

    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // Do not perform any work if new and old ThemeMode are identical
    if (newThemeMode == _themeMode) return;

    // Otherwise, store the new ThemeMode in memory
    _themeMode = newThemeMode;

    // Important! Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateThemeMode(newThemeMode);
  }

  Future<void> updateApiUrl(String newApiUrl) async {
    if (newApiUrl == _apiUrl) return;

    HttpRequest req = HttpRequest(newApiUrl);
    _apiUrl = await req.getApiUrl();

    notifyListeners();

    await _settingsService.updateApiUrl(_apiUrl);
  }
}
