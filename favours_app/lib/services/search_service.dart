import 'package:http/http.dart' as http;

class SearchService {
  static Future<String> searchDjangoApi(String query) async {
    String url = 'http://192.168.1.98:8000/api/posts/?search=$query';
    http.Response response = await http.get(Uri.encodeFull(url));

    return response.body;
  }
}