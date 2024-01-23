import 'dart:developer';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

void doSomething(String url) {
  HtmlParser parser;
  List<Element> elements;

  http.get(
    Uri.parse(url),
    headers: {
      'User-Agent':
          'Mozilla/5.0 (Linux; U; Android 4.0.2; en-us; Galaxy Nexus Build/ICL53F) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30',
    },
  ).then((response) => {
        if (response.statusCode == 301)
          {log(response.headers['location'].toString())}
        else
          {
            parser = HtmlParser(response.body, encoding: 'UTF-8'),
            elements = parser
                .parse()
                .querySelector('div.miso-post-gallery')!
                .querySelectorAll('div.post-row'),
            for (var element in elements)
              {log(element.querySelector('img')!.attributes['src'].toString())}
          }
      });
}
