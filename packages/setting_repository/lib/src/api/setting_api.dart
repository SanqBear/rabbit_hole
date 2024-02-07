


import 'package:flutter/material.dart';

abstract class SettingApi {
  const SettingApi();

  Stream<ThemeMode> themeMode();
  
  Future<void> updateThemeMode(ThemeMode theme);
}