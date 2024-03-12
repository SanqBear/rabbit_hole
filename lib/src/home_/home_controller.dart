import 'package:flutter/material.dart';
import 'package:rabbit_hole/src/home_/home_service.dart';
import 'package:rabbit_hole/src/model/manga_pack.dart';

class HomeController with ChangeNotifier {
  HomeController();

  final HomeService _homeService = HomeService();

  late List<MangaPack> _recent;
  late List<MangaPack> _best;
  late List<MangaPack> _weekly;

  List<MangaPack> get recent => _recent;
  List<MangaPack> get best => _best;
  List<MangaPack> get weekly => _weekly;


  Future<void> fetchHomeData(String url) async {
    _recent = [];
    _best = [];
    _weekly = [];
    await _homeService.fetchHomepage(url);
    await loadRecentManga(url);
  }
  
  Future<void> loadRecentManga(String url) async {
    _recent = await _homeService.loadRecentManga(url);

    notifyListeners();
  }

  Future<void> loadBestManga(String url) async {

  }

  Future<void> loadWeeklyManga(String url) async {

  }

}