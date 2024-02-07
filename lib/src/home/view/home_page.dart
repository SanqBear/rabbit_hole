import 'package:flutter/material.dart';
import 'package:rabbit_playground/src/setting/setting.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingPage.routeName);
            },
          )
        ]
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
