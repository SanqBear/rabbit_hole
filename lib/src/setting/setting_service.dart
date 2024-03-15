import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rabbit_hole/src/api/toki_api.dart';

class SettingService {
  SettingService({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;
  final TokiApi _tokiApi = const TokiApi('');

  Future<String> apiUrl() async {
    return Future.value(_sharedPreferences.getString('apiUrl') ?? '');
  }

  Future<String> locale() async {
    return Future.value(_sharedPreferences.getString('locale') ?? 'en');
  }

  Future<ThemeMode> themeMode() async {
    return Future.value(
        ThemeMode.values[_sharedPreferences.getInt('themeMode') ?? 0]);
  }

  Future<String> fetchApiUrl(String url) async {
    return await _tokiApi.fetchApiUrl(url);
  }

  Future<bool> checkApiUrl(String apiUrl) async {
    if (apiUrl.isEmpty) return Future.value(false);

    try {
      await _tokiApi.fetchApiUrl(apiUrl);
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<void> updateApiUrl(String apiUrl) async {
    await _sharedPreferences.setString('apiUrl', apiUrl);
  }

  Future<void> updateLocale(String locale) async {
    await _sharedPreferences.setString('locale', locale);
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await _sharedPreferences.setInt('themeMode', themeMode.index);
  }

  Future<void> clear() async {
    await _sharedPreferences.clear();
  }
}
