import 'package:flutter/material.dart';

import 'package:sanq_viewer/src/bootstrap.dart';
import 'package:sanq_viewer/src/setting/setting_controller.dart';
import 'package:sanq_viewer/src/setting/setting_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences preferences =
      await SharedPreferences.getInstance();

  final settingController = SettingController(SettingService(preferences: preferences));
  await settingController.load();

  bootstrap(settingController: settingController);
}
