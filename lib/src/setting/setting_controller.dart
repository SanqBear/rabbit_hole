import 'package:flutter/material.dart';
import 'package:rabbit_hole/src/api/toki_api.dart';
import 'package:rabbit_hole/src/setting/setting_service.dart';

class SettingController with ChangeNotifier {
  SettingController({required SettingService service}) : _service = service;
  
  final SettingService _service;

  late String _apiUrl;
  late ThemeMode _themeMode;
  late String _locale;

  String get apiUrl => _apiUrl;
  ThemeMode get themeMode => _themeMode;
  String get locale => _locale;

  Future<void> loadSettings() async {
    _apiUrl = await _service.apiUrl();
    _themeMode = await _service.themeMode();
    _locale = await _service.locale();
  }

  Future<void> updateApiUrl(String newUrl) async {
    var newApiUrl = await const TokiApi().fetchApiUrl(newUrl);

    if(newApiUrl == _apiUrl) return;

    _apiUrl = newApiUrl;

    notifyListeners();

    await _service.updateApiUrl(newApiUrl);
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if(newThemeMode == null) return;
    if(newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();

    await _service.updateThemeMode(newThemeMode);
  }

  Future<void> updateLocale(String newLocale) async {
    if(newLocale == _locale) return;

    _locale = newLocale;

    notifyListeners();

    await _service.updateLocale(newLocale);
  }
}