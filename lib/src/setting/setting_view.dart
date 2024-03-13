import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:rabbit_hole/src/component/toki_drawer.dart';
import 'package:rabbit_hole/src/setting/setting.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key, required this.settingController});

  static const routeName = '/setting';

  final SettingController settingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const TokiDrawer(),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              ThemeModeSettingPanel(
                  value: settingController.themeMode,
                  onChanged: settingController.updateThemeMode),
              LocaleSettingPanel(
                value: settingController.locale,
                onChanged: settingController.updateLocale,
              )
            ])));
  }
}

class ThemeModeSettingPanel extends StatelessWidget {
  const ThemeModeSettingPanel(
      {super.key, ThemeMode? value, Function? onChanged})
      : _value = value,
        _onChanged = onChanged;

  final ThemeMode? _value;
  final Function? _onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ThemeMode>(
        value: _value,
        onChanged: (val) => _onChanged != null ? _onChanged(val) : (val) {},
        items: [
          DropdownMenuItem(
              value: ThemeMode.system,
              child: Text(AppLocalizations.of(context)!.theme_system)),
          DropdownMenuItem(
              value: ThemeMode.light,
              child: Text(AppLocalizations.of(context)!.theme_light)),
          DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text(AppLocalizations.of(context)!.theme_dark)),
        ],
        underline: Container());
  }
}

class LocaleSettingPanel extends StatelessWidget {
  const LocaleSettingPanel({super.key, String? value, Function? onChanged})
      : _locale = value,
        _onChanged = onChanged;

  final String? _locale;
  final Function? _onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: _locale ?? 'en',
        onChanged: (val) => _onChanged != null ? _onChanged(val) : (val) {},
        items: [
          DropdownMenuItem(
              value: 'en', child: Text(AppLocalizations.of(context)!.lang_en)),
          DropdownMenuItem(
              value: 'ja', child: Text(AppLocalizations.of(context)!.lang_ja)),
          DropdownMenuItem(
              value: 'ko', child: Text(AppLocalizations.of(context)!.lang_ko)),
          DropdownMenuItem(
              value: 'zh', child: Text(AppLocalizations.of(context)!.lang_zh))
        ]);
  }
}
