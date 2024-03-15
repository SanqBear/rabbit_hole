import 'package:flutter/material.dart';
import 'package:rabbit_hole/src/component/toki_drawer.dart';
import 'package:rabbit_hole/src/home/home_controller.dart';
import 'package:rabbit_hole/src/setting/setting_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key, required SettingController settingController})
      : _setting = settingController;

  static const routeName = '/';

  final SettingController _setting;
  final HomeController _home = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const TokiDrawer(),
        body: (_setting.apiUrl == '')
            ? WelcomeSection(
                settingController: _setting,
              )
            : const Center(child: Text('Home View..  work in progress')));
  }
}

class WelcomeSection extends StatelessWidget {
  const WelcomeSection(
      {super.key, required SettingController settingController})
      : _setting = settingController;

  final SettingController _setting;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Welcome to Rabbit Hole'),
        TextField(
          decoration: InputDecoration(
            labelText: 'URL',
            hintText: 'URL',
            prefixIcon: const Icon(Icons.web),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
