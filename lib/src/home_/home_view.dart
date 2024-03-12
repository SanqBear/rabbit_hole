import 'package:flutter/material.dart';
import 'package:rabbit_hole/src/home_/home_controller.dart';
import 'package:rabbit_hole/src/settings/settings.dart';
import 'package:rabbit_hole/src/settings/settings_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key, required HomeController controller, required SettingsController settingsController}) : _controller = controller, _settingsController = settingsController;

  final HomeController _controller;
  final SettingsController _settingsController;
  @override
  Widget build(BuildContext context) {
    if(_settingsController.apiUrl == '') {
      return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } 
    else {
    _controller.fetchHomeData(_settingsController.apiUrl);
    return ListenableBuilder(
      listenable: _controller,
      builder:(context, child) => Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
        ),
        body: ListView.builder(
          itemCount: _controller.recent.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_controller.recent[index].title),
              leading: Image.network(_controller.recent[index].thumbnail),
            );
          },
        ),
      ));
    }
  }
}