import 'package:flutter/material.dart';
import 'package:rabbit_hole/src/component/toki_drawer.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const TokiDrawer(),
        body: const Center(child: Text('Search View..  work in progress')));
  }
}
