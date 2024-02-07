import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:setting_repository/setting_repository.dart';

import 'src/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final settingRepository = SettingRepository(
      settingApi: LocalStorageSettingApi(sharedPreferences: sharedPreferences));

  runApp(App(settingRepository: settingRepository));
}
