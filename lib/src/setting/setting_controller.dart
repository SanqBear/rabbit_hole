import 'package:flutter/material.dart';
import 'package:rabbit_hole/src/setting/setting_service.dart';

class SettingController with ChangeNotifier {
  SettingController({required SettingService service}) : _service = service;

  final SettingService _service;

  late String _apiUrl;
  late ThemeMode _themeMode;
  late String _locale;
  late bool _isApiUrlOkay = false;
  late bool _isInitialized = false;

  String get apiUrl => _apiUrl;
  ThemeMode get themeMode => _themeMode;
  String get locale => _locale;
  bool get isApiUrlOkay => _isApiUrlOkay;
  bool get isInitialized => _isInitialized;

  Future<void> loadSettings() async {
    _apiUrl = await _service.apiUrl();
    _themeMode = await _service.themeMode();
    _locale = await _service.locale();
    _isApiUrlOkay = await _service.checkApiUrl(_apiUrl);
  }

  Future<void> updateApiUrl(String newUrl) async {
    String newApiUrl = await _service.fetchApiUrl(newUrl);

    if (newApiUrl == _apiUrl) {
      _isApiUrlOkay = await _service.checkApiUrl(_apiUrl);
      return;
    }

    _apiUrl = newApiUrl;
    _isApiUrlOkay = await _service.checkApiUrl(_apiUrl);

    notifyListeners();

    await _service.updateApiUrl(newApiUrl);
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();

    await _service.updateThemeMode(newThemeMode);
  }

  Future<void> updateLocale(String newLocale) async {
    if (newLocale == _locale) return;

    _locale = newLocale;

    notifyListeners();

    await _service.updateLocale(newLocale);
  }

  Future<void> reset() async {
    _apiUrl = '';
    _themeMode = ThemeMode.system;
    _locale = 'en';
    _isApiUrlOkay = false;

    await _service.clear();

    notifyListeners();
  }
}
