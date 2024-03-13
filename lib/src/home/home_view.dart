import 'package:flutter/material.dart';
import 'package:rabbit_hole/src/component/toki_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const TokiDrawer(),
        body: const Center(child: Text('Home View..  work in progress')));
  }
}
