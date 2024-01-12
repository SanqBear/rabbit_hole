import 'package:flutter/material.dart';
import 'package:sanq_viewer/src/setting/setting_service.dart';

class SettingController with ChangeNotifier {
  SettingController(this._settingService);

  final SettingService _settingService;

  late ThemeMode _themeMode;
  late String _locale;
  late String _baseUrl;

  ThemeMode get themeMode => _themeMode;
  String get locale => _locale;
  String get baseUrl => _baseUrl;

  Future<void> load() async {
    _themeMode = await _settingService.themeMode();
    _locale = await _settingService.locale();
    _baseUrl = await _settingService.baseUrl();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await _settingService.updateThemeMode(themeMode);
    _themeMode = themeMode;
    notifyListeners();
  }

  Future<void> updateLocale(String locale) async {
    await _settingService.updateLocale(locale);
    _locale = locale;
    notifyListeners();
  }

  Future<void> updateBaseUrl(String baseUrl) async {
    await _settingService.updateBaseUrl(baseUrl);
    _baseUrl = baseUrl;
    notifyListeners();
  }
}