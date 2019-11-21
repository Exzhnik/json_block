
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_block/data/model/result.dart';
import 'package:json_block/res/url/url.dart';


abstract class Repository {
  Future<List<Articles>> getArticles();
}

class RepositoryImpl implements Repository {

  @override
  Future<List<Articles>> getArticles() async {
    var response = await http.get(Url.url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Articles> articles = Result.fromJson(data).articles;
      return articles;
    } else {
      throw Exception();
    }
  }

}