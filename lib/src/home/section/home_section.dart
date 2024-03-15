import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:rabbit_hole/src/home/home_controller.dart';
import 'package:rabbit_hole/src/setting/setting_controller.dart';

class MainHomeSection extends StatelessWidget {
  MainHomeSection({super.key, required SettingController settingController})
      : _setting = settingController;

  final SettingController _setting;
  final HomeController _home = HomeController();

  @override
  Widget build(BuildContext context) {
    _home.init(_setting.apiUrl);

    return const Center(child: Text('Home View..  work in progress'));
  }
}
