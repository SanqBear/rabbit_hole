import 'package:flutter/material.dart';

import '../setting/setting_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/';

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
      body: Center()
    );
  }
}
