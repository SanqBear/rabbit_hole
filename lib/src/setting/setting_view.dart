import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:rabbit_hole/src/component/toki_drawer.dart';
import 'package:rabbit_hole/src/setting/setting_controller.dart';
import 'package:rabbit_hole/src/util/size_handler.dart';

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
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              ThemeModeSettingPanel(
                  value: settingController.themeMode,
                  onChanged: settingController.updateThemeMode),
              const SizedBox(height: 10),
              LocaleSettingPanel(
                value: settingController.locale,
                onChanged: settingController.updateLocale,
              ),
              const SizedBox(height: 10),
              ApiUrlSettingPanel(onSubmitted: settingController.updateApiUrl),
              const SizedBox(height: 10),
              ApiUrlConfirmPanel(
                  url: settingController.apiUrl,
                  isOkay: settingController.isApiUrlOkay),
              const SizedBox(height: 36),
              ResetSettingPanel(onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: Text(AppLocalizations.of(context)!.reset),
                        content:
                            Text(AppLocalizations.of(context)!.reset_confirm),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child:
                                  Text(AppLocalizations.of(context)!.cancel)),
                          TextButton(
                              onPressed: () => {
                                    settingController.reset(),
                                    Navigator.of(context).pop()
                                  },
                              child: Text(AppLocalizations.of(context)!.reset))
                        ],
                      );
                    });
              })
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
    var size = SizeHandler(context);
    return Row(
      children: [
        SizedBox(
            width: size.inplaceMode == InplaceMode.landscape
                ? size.getWidth(15)
                : size.getWidth(20),
            child: Text(AppLocalizations.of(context)!.theme)),
        SizedBox(
            width: size.inplaceMode == InplaceMode.landscape
                ? size.getWidth(5)
                : size.getWidth(1)),
        Flexible(
            fit: FlexFit.tight,
            child: DropdownButton<ThemeMode>(
              value: _value,
              onChanged: (val) =>
                  _onChanged != null ? _onChanged(val) : (val) {},
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
              underline: Container(),
              isExpanded: true,
              focusColor: Colors.transparent,
            )),
      ],
    );
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
    var size = SizeHandler(context);
    return Row(
      children: [
        SizedBox(
            width: size.inplaceMode == InplaceMode.landscape
                ? size.getWidth(15)
                : size.getWidth(20),
            child: Text(AppLocalizations.of(context)!.language)),
        SizedBox(
            width: size.inplaceMode == InplaceMode.landscape
                ? size.getWidth(5)
                : size.getWidth(1)),
        Flexible(
            fit: FlexFit.tight,
            child: DropdownButton<String>(
                value: _locale ?? 'en',
                onChanged: (val) =>
                    _onChanged != null ? _onChanged(val) : (val) {},
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
                isExpanded: true,
                focusColor: Colors.transparent)),
      ],
    );
  }
}

class ApiUrlSettingPanel extends StatelessWidget {
  ApiUrlSettingPanel({super.key, String? value, Function? onSubmitted})
      : _onSubmitted = onSubmitted;

  final Function? _onSubmitted;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = SizeHandler(context);
    return Row(
      children: [
        SizedBox(
            width: size.inplaceMode == InplaceMode.landscape
                ? size.getWidth(15)
                : size.getWidth(20),
            child: Text(AppLocalizations.of(context)!.set_url)),
        SizedBox(
            width: size.inplaceMode == InplaceMode.landscape
                ? size.getWidth(5)
                : size.getWidth(1)),
        Flexible(
            fit: FlexFit.tight,
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.set_url_desc,
                hintText: AppLocalizations.of(context)!.set_url_placeholder,
                border: const UnderlineInputBorder(),
              ),
              onSubmitted: (val) {
                if (_onSubmitted != null) _onSubmitted(val);
                _textEditingController.clear();
              },
            )),
      ],
    );
  }
}

class ApiUrlConfirmPanel extends StatelessWidget {
  const ApiUrlConfirmPanel({super.key, String? url, bool? isOkay})
      : _url = url,
        _isOkay = isOkay;

  final String? _url;
  final bool? _isOkay;

  @override
  Widget build(BuildContext context) {
    var size = SizeHandler(context);
    return Row(
      children: [
        SizedBox(
            width: size.inplaceMode == InplaceMode.landscape
                ? size.getWidth(15)
                : size.getWidth(20),
            child: Text(AppLocalizations.of(context)!.api_url)),
        SizedBox(
            width: size.inplaceMode == InplaceMode.landscape
                ? size.getWidth(5)
                : size.getWidth(1)),
        Text(_url?.isEmpty ?? true
            ? AppLocalizations.of(context)!.api_url_isempty
            : _url!),
        _isOkay == true
            ? const Icon(Icons.check, color: Colors.green)
            : const Icon(Icons.close, color: Colors.red),
      ],
    );
  }
}

class ResetSettingPanel extends StatelessWidget {
  const ResetSettingPanel({super.key, Function? onPressed})
      : _onPressed = onPressed;

  final Function? _onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () => _onPressed != null ? _onPressed() : () {},
            child: Text(AppLocalizations.of(context)!.reset)),
      ],
    );
  }
}
