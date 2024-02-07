import 'package:flutter/material.dart';
import 'package:rabbit_playground/src/app/app.dart';

List<Page<dynamic>> onGenerateAppViewPages(
    AppView appView, List<Page<dynamic>> pages) {
  return [
    MaterialPage(
      child: appView,
    ),
  ];
}
