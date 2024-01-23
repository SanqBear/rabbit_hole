import 'package:flutter/material.dart';
import 'package:sanq_viewer/src/setting/setting_service.dart';

class SettingController with ChangeNotifier {
  SettingController(this._settingService);

  final SettingService _settingService;

  late ThemeMode _themeMode;
  late String _locale;
  late String _baseUrl;
  late String _apiUrl;
  late bool _isFirstRun;

  ThemeMode get themeMode => _themeMode;
  String get locale => _locale;
  String get baseUrl => _baseUrl;
  String get apiUrl => _apiUrl;
  bool get isFirstRun => _isFirstRun;

  Future<void> load() async {
    _themeMode = await _settingService.themeMode();
    _locale = await _settingService.locale();
    _baseUrl = await _settingService.baseUrl();
    _apiUrl = await _settingService.apiUrl();
    _isFirstRun = await _settingService.isFirstRun();
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

  Future<void> updateApiUrl(String apiUrl) async {
    await _settingService.updateApiUrl(apiUrl);
    _apiUrl = apiUrl;
    notifyListeners();
  }

  Future<void> updateIsFirstRun(bool isFirstRun) async {
    await _settingService.updateIsFirstRun(isFirstRun);
    _isFirstRun = isFirstRun;
    notifyListeners();
  }
}
