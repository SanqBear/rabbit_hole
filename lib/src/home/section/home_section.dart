import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:rabbit_hole/src/home/home_controller.dart';
import 'package:rabbit_hole/src/setting/setting_controller.dart';

class MainHomeSection extends StatelessWidget {
  MainHomeSection({super.key, required SettingController settingController})
      : _setting = settingController;

  final SettingController _setting;
  final HomeController _home = HomeController();

  @override
  Widget build(BuildContext context) {
    _home.init(_setting.apiUrl);

    return Column(children: [RecentMangaPanel(homeController: _home)]);
  }
}

class RecentMangaPanel extends StatelessWidget {
  const RecentMangaPanel({super.key, required HomeController homeController})
      : _home = homeController;

  final HomeController _home;

  @override
  Widget build(BuildContext context) {
    _home.load();
    return Column(
      children: [
        Text('RECENT MANGA'),
        const SizedBox(height: 10),
        FutureBuilder(
            initialData: _home.recent,
            future: _home.loadRecent(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.hasData ? snapshot.data.length : 0,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].updatedAt),
                      );
                    });
              }
            }),
      ],
    );
  }
}
