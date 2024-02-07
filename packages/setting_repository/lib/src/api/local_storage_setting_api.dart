
import 'package:flutter/material.dart';
import 'package:setting_repository/src/api/setting_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageSettingApi implements SettingApi {
  final SharedPreferences _sharedPreferences;

  static const String preferenceKeyPrefix = "__rapl_setting_key__";

  const LocalStorageSettingApi({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Stream<ThemeMode> themeMode() async* { 
    yield ThemeMode.values[_sharedPreferences.getInt("${preferenceKeyPrefix}theme") ?? 0]; 
  }

  @override
  Future<void> updateThemeMode(ThemeMode theme) async {
    await _sharedPreferences.setInt("${preferenceKeyPrefix}theme", theme.index);
  }
}
