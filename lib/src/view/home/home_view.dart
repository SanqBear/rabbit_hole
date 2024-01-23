import 'package:flutter/material.dart';
import 'package:sanq_viewer/src/setting/setting_controller.dart';
import 'package:sanq_viewer/src/view/manga/manga_front_view.dart';
import 'package:sanq_viewer/src/view/webtoon/webtoon_front_view.dart';
import 'package:sanq_viewer/util/device_size.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "/";
  const HomeView({super.key, required this.settingController});

  final SettingController settingController;
  final int _idx = 0;

  @override
  Widget build(BuildContext context) {
    DeviceSize deviceSize = DeviceSize(context);
    deviceSize.init();

    return Scaffold(
      appBar: AppBar(
        title: Text('Manga'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: deviceSize.height * 0.1,
              child: DrawerHeader(
                child: Text('Manga'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text('Tile 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Tile 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
          index: _idx, children: const [MangaFrontView(), WebtoonFrontView()]),
      bottomNavigationBar: deviceSize.aspectRatio > 1
          ? null
          : SizedBox(
              height: deviceSize.height * 0.08,
              child: BottomAppBar(
                  padding: EdgeInsets.zero,
                  notchMargin: 0,
                  shape: const CircularNotchedRectangle(),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: deviceSize.width * 0.4,
                            child: TextButton(
                                onPressed: () => {}, child: Text('Manga'))),
                        SizedBox(
                            width: deviceSize.width * 0.4,
                            child: TextButton(
                                onPressed: () => {}, child: Text('Webtoon'))),
                      ])),
            ),
    );
  }
}
