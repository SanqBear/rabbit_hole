import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sanq_viewer/src/home/home_cubit.dart';
import 'package:sanq_viewer/src/home/view/manga_home_view.dart';
import 'package:sanq_viewer/src/home/view/webtoon_home_view.dart';
import 'package:sanq_viewer/util/device_size.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
        create: (_) => HomeCubit(),
        child: (context, child) => const HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceSize deviceSize = DeviceSize(context);
    final selectedTab =
        context.select<HomeCubit, HomeTab>((homeCubit) => homeCubit.state.tab);
    deviceSize.init();

    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: const [MangaHomeView(), WebtoonHomeView()],
      ),
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
                                onPressed: () => {
                                      context
                                          .read<HomeCubit>()
                                          .setTab(HomeTab.manga)
                                    },
                                child: Text('Manga'))),
                        SizedBox(
                            width: deviceSize.width * 0.4,
                            child: TextButton(
                                onPressed: () => {
                                      context
                                          .read<HomeCubit>()
                                          .setTab(HomeTab.manga)
                                    },
                                child: Text('Webtoon'))),
                      ])),
            ),
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
    );
  }
}
