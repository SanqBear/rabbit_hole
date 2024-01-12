import 'package:flutter/material.dart';


class SettingService {
  Future<ThemeMode> themeMode() async {
    return ThemeMode.system;
  }

  Future<String> locale() async {
    return 'en';
  }

  Future<String> baseUrl() async {
    return '';
  }


  Future<void> updateThemeMode(ThemeMode themeMode) async {

  }

  Future<void> updateLocale(String locale) async {

  }

  Future<void> updateBaseUrl(String baseUrl) async {

  }
}