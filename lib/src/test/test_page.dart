import 'package:flutter/material.dart';

import 'package:sanq_viewer/src/setting/setting_controller.dart';
import 'package:sanq_viewer/src/api/api_test.dart';

class TestPage extends StatelessWidget {
  static const String routeName = "/test";
  const TestPage({super.key, required this.settingController});

  final SettingController settingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Welcome to the Home View!',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
                onPressed: () => {doSomething(settingController.baseUrl)},
                child: const Text('Click'))
          ],
        ),
      ),
    );
  }
}
