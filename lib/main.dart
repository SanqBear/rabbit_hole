import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sanq_viewer/src/app.dart';
import 'package:sanq_viewer/src/setting/setting_controller.dart';
import 'package:sanq_viewer/src/setting/setting_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) => log(details.exceptionAsString(), stackTrace: details.stack);

  final SharedPreferences preferences =
      await SharedPreferences.getInstance();

  final settingController = SettingController(SettingService(preferences: preferences));
  await settingController.load();

  runApp(App(settingController: settingController));
}
