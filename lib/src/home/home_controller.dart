import 'package:flutter/material.dart';
import 'package:rabbit_hole/src/home/home_service.dart';
import 'package:rabbit_hole/src/home/home_service_sample.dart';
import 'package:rabbit_hole/src/model/manga_item.dart';

class HomeController with ChangeNotifier {
  HomeController();

  late SampleHomeService _service;

  late String _apiUrl;

  late List<MangaItem> _recent = [];
  late List<MangaItem> _weekly = [];
  late List<MangaItem> _popular = [];

  List<MangaItem> get recent => _recent;
  List<MangaItem> get weekly => _weekly;
  List<MangaItem> get popular => _popular;

  void init(String apiUrl) {
    _apiUrl = apiUrl;
    _service = SampleHomeService(_apiUrl);
  }

  Future<void> load() async {
    await loadRecent();
    await loadWeekly();
    await loadPopular();
  }

  Future<void> loadRecent() async {
    _recent = await _service.fetchRecent();
    notifyListeners();
  }

  Future<void> loadWeekly() async {
    _weekly = await _service.fetchWeekly();
    notifyListeners();
  }

  Future<void> loadPopular() async {
    _popular = await _service.fetchPopular();
    notifyListeners();
  }
}
