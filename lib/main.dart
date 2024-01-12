import 'package:flutter/material.dart';
import 'package:sanq_viewer/src/setting/setting_service.dart';

void main() async {
  final settingController = SettingController(SettingService());
  await settingController.load();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
