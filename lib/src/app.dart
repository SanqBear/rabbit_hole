import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:sanq_viewer/src/setting/setting_controller.dart';

class App extends StatelessWidget {
  const App({
    required this.settingController,
    super.key
  });

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
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Locale(settingController.locale),
        );
      }
    );
  }
}