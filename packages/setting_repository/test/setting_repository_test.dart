import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setting_repository/setting_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('setting', () {
    const ThemeMode themeMode = ThemeMode.system;

    test('update themeMode to local storage', () async {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setInt(
          "${LocalStorageSettingApi.preferenceKeyPrefix}theme",
          themeMode.index);
      expect(
          ThemeMode.values[sharedPreferences.getInt(
                  "${LocalStorageSettingApi.preferenceKeyPrefix}theme") ??
              0],
          equals(themeMode));
    });
  });
}
