import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:validators/validators.dart';

import 'package:sanq_viewer/src/setting/setting_controller.dart';

class FirstrunWizardView extends StatefulWidget {
  const FirstrunWizardView({required this.settingController, super.key});

  final SettingController settingController;

  @override
  State<FirstrunWizardView> createState() => _FirstRunWizardState();
}

class _FirstRunWizardState extends State<FirstrunWizardView> {
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IndexedStack(
            index: idx,
            children: [
              LocaleSettingWizard(
                  moveToBeforeHandler: () => setState(() => idx--),
                  moveToNextHandler: () => setState(() => idx++),
                  confirmEventHandler: (value) =>
                      {widget.settingController.updateLocale(value)}),
              ThemeModeSettingWizard(
                  moveToBeforeHandler: () => setState(() => idx--),
                  moveToNextHandler: () => setState(() => idx++),
                  confirmEventHandler: (value) =>
                      {widget.settingController.updateThemeMode(value)}),
              BaseUrlSettingWizard(
                  moveToBeforeHandler: () => setState(() => idx--),
                  moveToNextHandler: () => setState(() => idx++),
                  confirmEventHandler: (value) => {
                        widget.settingController.updateBaseUrl(value),
                        widget.settingController.updateIsFirstRun(false)
                      }),
            ],
          ),
        ],
      )),
    );
  }
}

class LocaleSettingWizard extends StatelessWidget {
  const LocaleSettingWizard(
      {required this.confirmEventHandler,
      required this.moveToNextHandler,
      required this.moveToBeforeHandler,
      super.key});

  final Function confirmEventHandler;
  final Function moveToNextHandler;
  final Function moveToBeforeHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: null,
            // nothing to do. this is first page.
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!
                              .startWizardViewSelectYourLanguage),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.09,
                                    child: ElevatedButton(
                                      onPressed: () => {
                                        confirmEventHandler("en"),
                                      },
                                      child: Text(AppLocalizations.of(context)!
                                          .wordEnglish),
                                    ),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.09,
                                    child: ElevatedButton(
                                        onPressed: () => {
                                              confirmEventHandler("ko"),
                                            },
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .wordKorean)),
                                  ),
                                ],
                              )),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.09,
                                    child: ElevatedButton(
                                        onPressed: () => {
                                              confirmEventHandler("ja"),
                                            },
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .wordJapanese)),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.09,
                                    child: ElevatedButton(
                                        onPressed: () => {
                                              confirmEventHandler("zh"),
                                            },
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .wordChinese)),
                                  ),
                                ],
                              ))
                        ],
                      ))
                ],
              )),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () => {moveToNextHandler()}),
        ],
      ),
    );
  }
}

class ThemeModeSettingWizard extends StatelessWidget {
  const ThemeModeSettingWizard(
      {required this.confirmEventHandler,
      required this.moveToNextHandler,
      required this.moveToBeforeHandler,
      super.key});

  final Function confirmEventHandler;
  final Function moveToNextHandler;
  final Function moveToBeforeHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () => {
              moveToBeforeHandler(),
            },
            // nothing to do. this is first page.
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(AppLocalizations.of(context)!
                            .startWizardViewSelectApplicationTheme),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: ElevatedButton(
                              onPressed: () =>
                                  confirmEventHandler(ThemeMode.system),
                              child: Text(AppLocalizations.of(context)!
                                  .wordSystemTheme)),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: ElevatedButton(
                              onPressed: () =>
                                  confirmEventHandler(ThemeMode.light),
                              child: Text(AppLocalizations.of(context)!
                                  .wordLightTheme)),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: ElevatedButton(
                              onPressed: () =>
                                  confirmEventHandler(ThemeMode.dark),
                              child: Text(
                                  AppLocalizations.of(context)!.wordDarkTheme)),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () => {moveToNextHandler()}),
        ],
      ),
    );
  }
}

class BaseUrlSettingWizard extends StatefulWidget {
  const BaseUrlSettingWizard(
      {required this.confirmEventHandler,
      required this.moveToNextHandler,
      required this.moveToBeforeHandler,
      super.key});

  final Function confirmEventHandler;
  final Function moveToNextHandler;
  final Function moveToBeforeHandler;

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
                      if (!isURL(value) && !isURL('https://$value')) {
                        return AppLocalizations.of(context)!
                            .errMsgThisIsNotUrlFormat;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () => {
                                  if (_formKey.currentState!.validate())
                                    {
                                      if (!_inputController.text
                                              .startsWith("http://") &&
                                          !_inputController.text
                                              .startsWith("https://"))
                                        {
                                          widget.confirmEventHandler(
                                              'https://${_inputController.text}')
                                        }
                                      else
                                        {
                                          widget.confirmEventHandler(
                                              _inputController.text)
                                        }
                                    }
                                },
                            child:
                                Text(AppLocalizations.of(context)!.wordSubmit)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        ElevatedButton(
                            onPressed: () => {
                                  widget.moveToBeforeHandler(),
                                },
                            child: Text(AppLocalizations.of(context)!.wordBack))
                      ],
                    ),
                  ),
                ])))
      ],
    );
  }
}
