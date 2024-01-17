import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:sanq_viewer/src/setting/setting_controller.dart';
import 'package:sanq_viewer/src/util/util.dart';

class StartWizardView extends StatefulWidget {
  const StartWizardView({required this.settingController, super.key});

  final SettingController settingController;

  @override
  State<StartWizardView> createState() => _StartWizardViewState();
}

class _StartWizardViewState extends State<StartWizardView> {
  List<String> propertyNames = ["locale", "themeMode", "baseUrl"];
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IndexedStack(
              index: idx,
              children: [
                LocaleSettingWizard(
                    eventHandler: (value) => {
                          widget.settingController.updateLocale(value),
                          setState(() => idx++)
                        }),
                ThemeModeSettingWizard(
                    eventHandler: (value) => {
                          widget.settingController.updateThemeMode(value),
                          setState(() => idx++)
                        }),
                BaseUrlSettingWizard(
                    eventHandler: (value) => {
                          widget.settingController.updateBaseUrl(value),
                          setState(() => idx++)
                        }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LocaleSettingWizard extends StatelessWidget {
  const LocaleSettingWizard({required this.eventHandler, super.key});

  final Function eventHandler;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!
                    .startWizardViewSelectYourLanguage),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () => eventHandler("en"),
                            child: Text(
                                AppLocalizations.of(context)!.wordEnglish)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        ElevatedButton(
                            onPressed: () => eventHandler("ko"),
                            child:
                                Text(AppLocalizations.of(context)!.wordKorean)),
                      ],
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () => eventHandler("ja"),
                            child: Text(
                                AppLocalizations.of(context)!.wordJapanese)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        ElevatedButton(
                            onPressed: () => eventHandler("zh"),
                            child: Text(
                                AppLocalizations.of(context)!.wordChinese)),
                      ],
                    ))
              ],
            ))
      ],
    );
  }
}

class ThemeModeSettingWizard extends StatelessWidget {
  const ThemeModeSettingWizard({required this.eventHandler, super.key});

  final Function eventHandler;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(AppLocalizations.of(context)!
                    .startWizardViewSelectApplicationTheme),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ElevatedButton(
                    onPressed: () => eventHandler(ThemeMode.system),
                    child: Text(AppLocalizations.of(context)!.wordSystemTheme)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ElevatedButton(
                    onPressed: () => eventHandler(ThemeMode.light),
                    child: Text(AppLocalizations.of(context)!.wordLightTheme)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ElevatedButton(
                    onPressed: () => eventHandler(ThemeMode.dark),
                    child: Text(AppLocalizations.of(context)!.wordDarkTheme)),
              ],
            ))
      ],
    );
  }
}

class BaseUrlSettingWizard extends StatefulWidget {
  const BaseUrlSettingWizard({required this.eventHandler, super.key});

  final Function eventHandler;

  @override
  State<BaseUrlSettingWizard> createState() => _BaseUrlSettingWizardState();
}

class _BaseUrlSettingWizardState extends State<BaseUrlSettingWizard> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05),
            alignment: Alignment.center,
            child: Form(
                key: _formKey,
                child: Column(children: [
                  Text(AppLocalizations.of(context)!
                      .startWizardViewInputYourBaseUrl),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  TextFormField(
                    controller: _inputController,
                    decoration: const InputDecoration(
                      hintText: "https://example.com",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!
                            .errMsgThisFieldIsRequired;
                      }
                      if (!isUrl(value)) {
                        return AppLocalizations.of(context)!
                            .errMsgThisIsNotUrlFormat;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ElevatedButton(
                      onPressed: () => {
                            if (_formKey.currentState!.validate())
                              {
                                widget.eventHandler(_inputController.text),
                                Navigator.pop(context),
                              }
                          },
                      child: Text(AppLocalizations.of(context)!.wordSubmit)),
                ])))
      ],
    );
  }
}
