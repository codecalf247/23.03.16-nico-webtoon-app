import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = 'today';

  // await : 결과가 올 때까지 기다림
  // await를 쓰고 싶으면 async를 써야됨
  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final respones = await http.get(url);
    if (respones.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(respones.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
