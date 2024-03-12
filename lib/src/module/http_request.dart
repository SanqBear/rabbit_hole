import 'package:http/http.dart' as http;

class HttpRequest {
  HttpRequest(String url) : _baseUrl = url;

  final String _baseUrl;
  
  Future<String> getApiUrl() async {
    var response = await _get('');
    switch(response.statusCode) {
      case 200:
        return _baseUrl;
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

  Future<String> get(String relativeUrl) async {
    var response = await _get(relativeUrl);
    if(response.statusCode == 200) {
      return response.stream.bytesToString();
    } else {
      throw Exception('Failed to get $relativeUrl');
    }
  }
  


  Future<http.StreamedResponse> _get(String path) async {
    var request = http.Request('GET', Uri.parse('$_baseUrl$path'))..followRedirects = false;
    request.headers['User-Agent'] = 'Mozilla/5.0 (Linux; U; Android 4.0.2; en-us; Galaxy Nexus Build/ICL53F) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30';
    var baseClient = http.Client();
    return baseClient.send(request);
  }

  Future<http.StreamedResponse> _post(String path, {Map<String, String>? body}) async {
    var request = http.Request('POST', Uri.parse('$_baseUrl$path'))..followRedirects = false;
    request.headers['User-Agent'] = 'Mozilla/5.0 (Linux; U; Android 4.0.2; en-us; Galaxy Nexus Build/ICL53F) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30';
    request.bodyFields = body!;
    var baseClient = http.Client();
    return baseClient.send(request);
  }

}