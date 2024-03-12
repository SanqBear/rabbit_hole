import 'package:flutter/material.dart';
import 'package:rabbit_hole/src/setting/setting.dart';

import '../home/home_view.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key, required this.settingController});

  static const routeName = '/setting';

  final SettingController settingController;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color:Colors.blue),
              child: Text('Drawer Header')
            ),
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.pushNamed(context, HomeView.routeName);
              }
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {
                Navigator.pushNamed(context, SettingView.routeName);
              }
            )
          ]
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<ThemeMode>(value: settingController.themeMode
            , onChanged: settingController.updateThemeMode
            , items: const [
              DropdownMenuItem(child: Text('System Theme'), value: ThemeMode.system),
              DropdownMenuItem(child: Text('Light Theme'), value: ThemeMode.light),
              DropdownMenuItem(child: Text('Dark Theme'), value: ThemeMode.dark)
            ])
          ]
        )
      )
    );
  }
}