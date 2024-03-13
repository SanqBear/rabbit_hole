import 'package:flutter/material.dart';
import 'package:rabbit_hole/src/component/toki_drawer.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  static const routeName = '/favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const TokiDrawer(),
        body: const Center(child: Text('Favorite View..  work in progress')));
  }
}
