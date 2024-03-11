import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  SettingsService(SharedPreferences sharedPreferences) : _sharedPreferences = sharedPreferences;
  /// Loads the User's preferred ThemeMode from local or remote storage.
  
  final SharedPreferences _sharedPreferences;
  
  Future<ThemeMode> themeMode() async => Future.value(ThemeMode.values[_sharedPreferences.getInt('themeMode') ?? 0]);

  Future<String> apiUrl() async => Future.value(_sharedPreferences.getString('apiUrl') ?? '');

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    await _sharedPreferences.setInt('themeMode', theme.index);
  }

  Future<void> updateApiUrl(String url) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    await _sharedPreferences.setString('apiUrl', url);
  }
}
