import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingService {
  SettingService({required this.preferences});

  final SharedPreferences preferences;

  Future<ThemeMode> themeMode() async {
    final themeModeIdx = preferences.getInt("themeMode");
    if (themeModeIdx != null) {
      return ThemeMode.values[themeModeIdx];
    }

    return ThemeMode.system;
  }

  Future<String> locale() async {
    final locale = preferences.getString("locale");
    if (locale != null) {
      return locale;
    }

    return 'en';
  }

  Future<String> baseUrl() async {
    final baseUrl = preferences.getString("baseUrl");
    if (baseUrl != null) {
      return baseUrl;
    }

    return '';
  }

  Future<String> apiUrl() async {
    final apiUrl = preferences.getString("apiUrl");
    if (apiUrl != null) {
      return apiUrl;
    }

    return '';
  }

  Future<bool> isFirstRun() async {
    final isFirstRun = preferences.getBool("isFirstRunFlag");
    if (isFirstRun != null) {
      return isFirstRun;
    }

    return true;
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await preferences.setInt("themeMode", themeMode.index);
  }

  Future<void> updateLocale(String locale) async {
    await preferences.setString("locale", locale);
  }

  Future<void> updateBaseUrl(String baseUrl) async {
    await preferences.setString("baseUrl", baseUrl);
  }

  Future<void> updateApiUrl(String apiUrl) async {
    await preferences.setString("apiUrl", apiUrl);
  }

  Future<void> updateIsFirstRun(bool isFirstRun) async {
    await preferences.setBool("isFirstRunFlag", isFirstRun);
  }
}
