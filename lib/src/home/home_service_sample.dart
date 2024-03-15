import 'package:rabbit_hole/src/api/toki_api.dart';
import 'package:rabbit_hole/src/model/manga_item.dart';

class SampleHomeService {
  SampleHomeService(String apiUrl) : _tokiApi = TokiApi(apiUrl);

  final TokiApi _tokiApi;

  Future<List<MangaItem>> fetchRecent() async {
    return Future.value([
      MangaItem.fromParams(
          id: 1,
          title: 'Manga 1',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/1'),
      MangaItem.fromParams(
          id: 2,
          title: 'Manga 2',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/2'),
      MangaItem.fromParams(
          id: 3,
          title: 'Manga 3',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/3'),
      MangaItem.fromParams(
          id: 4,
          title: 'Manga 4',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/4'),
      MangaItem.fromParams(
          id: 5,
          title: 'Manga 5',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/5'),
    ]);
  }

  Future<List<MangaItem>> fetchWeekly() async {
    return Future.value([
      MangaItem.fromParams(
          id: 6,
          title: 'Manga 6',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/6'),
      MangaItem.fromParams(
          id: 7,
          title: 'Manga 7',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/7'),
      MangaItem.fromParams(
          id: 8,
          title: 'Manga 8',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/8'),
      MangaItem.fromParams(
          id: 9,
          title: 'Manga 9',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/9'),
      MangaItem.fromParams(
          id: 10,
          title: 'Manga 10',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/10'),
    ]);
  }

  Future<List<MangaItem>> fetchPopular() async {
    return Future.value([
      MangaItem.fromParams(
          id: 11,
          title: 'Manga 11',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/11'),
      MangaItem.fromParams(
          id: 12,
          title: 'Manga 12',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/12'),
      MangaItem.fromParams(
          id: 13,
          title: 'Manga 13',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/13'),
      MangaItem.fromParams(
          id: 14,
          title: 'Manga 14',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/14'),
      MangaItem.fromParams(
          id: 15,
          title: 'Manga 15',
          thumbnail: 'https://via.placeholder.com/150',
          url: 'https://example.com/manga/15'),
    ]);
  }
}
