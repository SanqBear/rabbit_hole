import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sanq_viewer/src/home/home_page.dart';
import 'package:sanq_viewer/src/test/test_page.dart';

import 'package:sanq_viewer/src/setting/setting_controller.dart';
import 'package:sanq_viewer/src/firstrun/firstrun_wizard_view.dart';

class App extends StatelessWidget {
  const App({required this.settingController, super.key});

  final SettingController settingController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: settingController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
              restorationScopeId: "app",
              theme: ThemeData(),
              darkTheme: ThemeData.dark(),
              themeMode: settingController.themeMode,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: Locale(settingController.locale),
              supportedLocales: const [
                Locale('en', 'en-US'),
                Locale('ja', 'ja-JP'),
                Locale('ko', 'ko-KR'),
                Locale('zh', 'zh-CN'),
              ],
              onGenerateRoute: (RouteSettings routeSettings) {
                return MaterialPageRoute<void>(
                    settings: routeSettings,
                    builder: (BuildContext context) {
                      if (settingController.isFirstRun) {
                        return FirstrunWizardView(
                            settingController: settingController);
                      } else {
                        switch (routeSettings.name) {
                          case TestPage.routeName:
                            return TestPage(
                                settingController: settingController);
                          case HomePage.routeName:
                          default:
                            return const HomeView();
                        }
                      }
                    });
              });
        });
  }
}
