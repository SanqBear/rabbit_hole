import 'package:http/http.dart' as http;

class TokiApi {
  const TokiApi();

  Future<String> fetchApiUrl(String url) async {
    var response = await _get(url);
    switch(response.statusCode) {
      case 200:
        return url;
      case 302: {
        if(response.headers['location'] == null) {
          throw Exception('Redirected but no location header');
        }
        
        return response.headers['location']!;
      }
      default:
        throw Exception('Failed to get api url');
    }
  }

  Future<String> get(String url) async {
    var response = await _get(url);
    if(response.statusCode == 200) {
      return response.stream.bytesToString();
    } else {
      throw Exception('Failed to get $url');
    }
  }




  Future<http.StreamedResponse> _get(String url) async {
    var request = http.Request('GET', Uri.parse(url))..followRedirects = false;
    request.headers['User-Agent'] =
        'Mozilla/5.0 (Linux; U; Android 4.0.2; en-us; Galaxy Nexus Build/ICL53F) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30';
    var client = http.Client();
    return client.send(request);
  }

  Future<http.StreamedResponse> _post(String url,
      {Map<String, String>? body}) async {
    var request = http.Request('POST', Uri.parse(url))..followRedirects = false;
    request.headers['User-Agent'] =
        'Mozilla/5.0 (Linux; U; Android 4.0.2; en-us; Galaxy Nexus Build/ICL53F) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30';
    request.bodyFields = body!;
    var client = http.Client();
    return client.send(request);
  }
}
