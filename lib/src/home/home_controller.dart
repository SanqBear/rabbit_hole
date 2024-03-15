import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  HomeController();

  late String _apiUrl;

  void init(String apiUrl) {
    _apiUrl = apiUrl;
  }


}
