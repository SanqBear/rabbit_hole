import 'dart:io';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

import 'src/setting/setting.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ensureAdjustWindowSize();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  
  final settingController = SettingController(service: LocalStorageSettingService(sharedPreferences: sharedPreferences));
  settingController.loadSettings();

  runApp(App(settingController: settingController));
}

// Ensure the window size is at least 360x640 on Windows
Future<void> ensureAdjustWindowSize() async {
  if(Platform.isWindows) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(360,640));
  }
}