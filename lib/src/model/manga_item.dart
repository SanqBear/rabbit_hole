class MangaItem {
  MangaItem();

  MangaItem.fromParams(
      {int? id, String? title, String? thumbnail, String? url}) {
    _id = id ?? -1;
    _title = title ?? '';
    _thumbnail = thumbnail ?? '';
    _url = url ?? '';
  }

  late int _id;
  late String _title;
  late String _thumbnail;
  late String _url;

  int get id => _id;
  String get title => _title;
  String get thumbnail => _thumbnail;
  String get url => _url;

  static MangaItem create(int id, String title, String thumbnail, String url) {
    var item = MangaItem();
    item._id = id;
    item._title = title;
    item._thumbnail = thumbnail;
    item._url = url;
    return item;
  }
}
