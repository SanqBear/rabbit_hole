import 'package:flutter/material.dart';

abstract class SettingService {
  Future<String> apiUrl();
  Future<ThemeMode> themeMode();
  Future<String> locale();

  Future<void> updateApiUrl(String apiUrl);
  Future<void> updateThemeMode(ThemeMode themeMode);
  Future<void> updateLocale(String locale);
}