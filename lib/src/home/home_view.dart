import 'package:flutter/material.dart';

import 'package:rabbit_hole/src/component/toki_drawer.dart';

import 'package:rabbit_hole/src/setting/setting_controller.dart';

import 'package:rabbit_hole/src/home/section/home_section.dart';
import 'package:rabbit_hole/src/home/section/welcome_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required SettingController settingController})
      : _setting = settingController;

  static const routeName = '/';

  final SettingController _setting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const TokiDrawer(),
        body: (_setting.apiUrl == '')
            ? WelcomeSection(
                settingController: _setting,
              )
            : MainHomeSection(
                settingController: _setting,
              ));
  }
}
