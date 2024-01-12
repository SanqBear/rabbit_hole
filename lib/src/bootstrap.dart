import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:sanq_viewer/src/app.dart';
import 'package:sanq_viewer/src/setting/setting_controller.dart';

void bootstrap({required SettingController settingController}) {
  FlutterError.onError = (details) => log(details.exceptionAsString(), stackTrace: details.stack);

  runZonedGuarded(
    () => runApp(App(settingController: settingController)), 
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}