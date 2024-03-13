import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:rabbit_hole/src/views.dart';

class TokiDrawer extends StatelessWidget {
  const TokiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: const [
      TokiDrawerHeader(),
      TokiDrawerItem(routeName: HomeView.routeName),
      TokiDrawerItem(routeName: FavoriteView.routeName),
      TokiDrawerItem(routeName: SearchView.routeName),
      TokiDrawerItem(routeName: SettingView.routeName)
    ]));
  }
}

class TokiDrawerHeader extends StatelessWidget {
  const TokiDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Text('Drawer Header'));
  }
}

class TokiDrawerItem extends StatelessWidget {
  const TokiDrawerItem({super.key, required this.routeName});

  final String routeName;

  Icon get _icon {
    switch (routeName) {
      case SettingView.routeName:
        return const Icon(Icons.settings);
      case SearchView.routeName:
        return const Icon(Icons.search);
      case FavoriteView.routeName:
        return const Icon(Icons.favorite);
      case HomeView.routeName:
      default:
        return const Icon(Icons.home);
    }
  }

  String getTitle(BuildContext context) {
    switch (routeName) {
      case SettingView.routeName:
        return AppLocalizations.of(context)!.setting;
      case SearchView.routeName:
        return AppLocalizations.of(context)!.search;
      case FavoriteView.routeName:
        return AppLocalizations.of(context)!.favorite;
      case HomeView.routeName:
      default:
        return AppLocalizations.of(context)!.home;
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = getTitle(context);

    return ListTile(
        title: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, routeName);
          },
          child: Text(title),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, routeName);
            },
            child: _icon),
        selected: ModalRoute.of(context)!.settings.name == routeName,
        onTap: () => {});
  }
}
