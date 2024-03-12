
import 'package:flutter/material.dart';
import 'package:rabbit_hole/src/setting/setting_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageSettingService extends SettingService {
  LocalStorageSettingService({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<String> apiUrl() async {
    return Future.value(_sharedPreferences.getString('apiUrl') ?? '');
  }

  @override
  Future<String> locale() async {
    return Future.value(_sharedPreferences.getString('locale') ?? 'en');
  }

  @override
  Future<ThemeMode> themeMode() async {
    return Future.value(ThemeMode.values[_sharedPreferences.getInt('themeMode') ?? 0]);
  }

  @override
  Future<void> updateApiUrl(String apiUrl) async {
    await _sharedPreferences.setString('apiUrl', apiUrl);
  }

  @override
  Future<void> updateLocale(String locale) async {
    await _sharedPreferences.setString('locale', locale);
  }

  @override
  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await _sharedPreferences.setInt('themeMode', themeMode.index);
  }
}