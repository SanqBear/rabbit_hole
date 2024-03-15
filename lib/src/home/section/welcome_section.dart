import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:rabbit_hole/src/setting/setting_controller.dart';
import 'package:rabbit_hole/src/util/size_handler.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection(
      {super.key, required SettingController settingController})
      : _setting = settingController;

  final SettingController _setting;

  @override
  Widget build(BuildContext context) {
    var size = SizeHandler(context);
    return Column(
      children: [
        SizedBox(height: size.getHeight(20)),
        Text(AppLocalizations.of(context)!.welcome_msg),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.set_url_desc,
                  hintText: AppLocalizations.of(context)!.set_url_placeholder,
                  prefixIcon: const Icon(Icons.web),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onSubmitted: (value) {
                  _setting.updateApiUrl(value);
                },
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                  value: _setting.locale,
                  onChanged: (value) {
                    _setting.updateLocale(value!);
                  },
                  items: [
                    DropdownMenuItem(
                        value: 'en',
                        child: Text(AppLocalizations.of(context)!.lang_en)),
                    DropdownMenuItem(
                        value: 'ja',
                        child: Text(AppLocalizations.of(context)!.lang_ja)),
                    DropdownMenuItem(
                        value: 'ko',
                        child: Text(AppLocalizations.of(context)!.lang_ko)),
                    DropdownMenuItem(
                        value: 'zh',
                        child: Text(AppLocalizations.of(context)!.lang_zh))
                  ],
                  underline: Container(),
                  isExpanded: false,
                  focusColor: Colors.transparent)
            ],
          ),
        ),
      ],
    );
  }
}
