import 'package:rabbit_hole/src/api/toki_api.dart';
import 'package:rabbit_hole/src/model/manga_item.dart';

class HomeService {
  HomeService(String apiUrl) : _tokiApi = TokiApi(apiUrl);

  final TokiApi _tokiApi;

  Future<List<MangaItem>> fetchRecent() async {
    return Future.value([]);
  }

  Future<List<MangaItem>> fetchWeekly() async {
    return Future.value([]);
  }

  Future<List<MangaItem>> fetchPopular() async {
    return Future.value([]);
  }
}
