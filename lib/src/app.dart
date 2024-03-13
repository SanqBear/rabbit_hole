import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:rabbit_hole/src/setting/setting_controller.dart';

import 'package:rabbit_hole/src/views.dart';

class App extends StatelessWidget {
  const App({super.key, required this.settingController});

  final SettingController settingController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: settingController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
              restorationScopeId: 'app',
              locale: Locale(settingController.locale),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ko'),
                Locale('ja'),
                Locale('zh')
              ],
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,
              theme: ThemeData(),
              darkTheme: ThemeData.dark(),
              themeMode: settingController.themeMode,
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute<void>(
                    settings: settings,
                    builder: (BuildContext context) {
                      switch (settings.name) {
                        case SettingView.routeName:
                          return SettingView(
                              settingController: settingController);
                        case SearchView.routeName:
                          return const SearchView();
                        case FavoriteView.routeName:
                          return const FavoriteView();
                        default:
                          return const HomeView();
                      }
                    });
              });
        });
  }
}
