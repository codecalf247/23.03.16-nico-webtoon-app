import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = 'today';

  // await : 결과가 올 때까지 기다림
  // await를 쓰고 싶으면 async를 써야됨
  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final respones = await http.get(url);
    if (respones.statusCode == 200) {
      print(respones.body);
      return;
    }
    throw Error();
  }
}
