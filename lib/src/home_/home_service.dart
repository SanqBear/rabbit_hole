import 'package:rabbit_hole/src/model/manga_pack.dart';
import 'package:rabbit_hole/src/module/http_request.dart';
import 'package:html/parser.dart' as parser;

class HomeService {
  HomeService();
  
  late String homeHtml = '';

  Future<void> fetchHomepage(String url) async {
    HttpRequest req = HttpRequest(url);
    homeHtml = await req.get('');
  }

  Future<List<MangaPack>> loadRecentManga(String url) async {
    if(homeHtml == '') {
      fetchHomepage(url);
    }

    var bodyEl = parser.parse(homeHtml).body;

    if(bodyEl == null) {
      return [];
    }

    var result = <MangaPack>[];

    for(var el in bodyEl.querySelector("div.miso-post-gallery")!.querySelectorAll("div.post-row")){
      var infoEl = el.querySelector("div.img-item");

      result.add(MangaPack(
        id: int.parse(el.querySelector("a")!.attributes["href"]!.split("comic/")[1]),
        title: infoEl!.querySelector("b")!.text,
        thumbnail: infoEl.querySelector("img")!.attributes["src"]!
      ));
    }

    return result;
  }

  Future<void> loadBestManga() async {
  }

  Future<void> loadJpBestManga() async {
  }



}