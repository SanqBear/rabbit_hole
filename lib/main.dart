import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:rabbit_hole/src/app.dart';
import 'package:rabbit_hole/src/setting/setting_controller.dart';
import 'package:rabbit_hole/src/setting/setting_service.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ensureAdjustWindowSize();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  final settingController = SettingController(
      service:
          SettingService(sharedPreferences: sharedPreferences));
  settingController.loadSettings();

  runApp(App(
    settingController: settingController,
  ));
}

// Ensure the window size is at least 360x640 on Windows
Future<void> ensureAdjustWindowSize() async {
  if (kIsWeb) return;
  if (Platform.isWindows) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(360, 640));
  }
}
