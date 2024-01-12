import 'package:flutter/material.dart';

import 'package:sanq_viewer/src/bootstrap.dart';
import 'package:sanq_viewer/src/setting/setting_controller.dart';
import 'package:sanq_viewer/src/setting/setting_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingController = SettingController(SettingService());
  await settingController.load();

  bootstrap(settingController: settingController);
}
