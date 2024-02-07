import 'package:cache/cache.dart';
import 'package:flutter/material.dart';
import 'package:setting_repository/src/api/setting_api.dart';

class SettingRepository {
  final SettingApi _settingApi;
  SettingRepository({
    required SettingApi settingApi,
    CacheClient? cache,
  })  : _settingApi = settingApi,
        _cache = cache ?? CacheClient();

  final CacheClient _cache;

  @visibleForTesting
  static const themeModeCacheKey = '__theme_cache_key__';

  Stream<ThemeMode> get themeMode {
    return _settingApi.themeMode().map((themeMode) {
      final theme = themeMode;
      _cache.write(key: themeModeCacheKey, value: theme);
      return theme;
    });
  } 

  ThemeMode get currentThemeMode {
    return _cache.read<ThemeMode>(key: themeModeCacheKey) ?? ThemeMode.system;
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    await _settingApi.updateThemeMode(theme);
  }
}
