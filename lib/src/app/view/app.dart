import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rabbit_playground/src/app/app.dart';
import 'package:rabbit_playground/src/home/home.dart';
import 'package:rabbit_playground/src/setting/setting.dart';
import 'package:rabbit_playground/src/style/style.dart';
import 'package:setting_repository/setting_repository.dart';

class App extends StatelessWidget {
  const App({super.key, required SettingRepository settingRepository})
      : _settingRepository = settingRepository;

  final SettingRepository _settingRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: _settingRepository),
        ],
        child: BlocProvider(
            create: (_) => AppBloc(settingRepository: _settingRepository),
            child: const AppView()));
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        restorationScopeId: 'app',
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        themeMode: context.select((AppBloc bloc) => bloc.state.theme),
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingPage.routeName:
                    return const SettingPage();
                  case HomePage.routeName:
                  default:
                    return const HomePage();
                }
              });
        });
  }
}
