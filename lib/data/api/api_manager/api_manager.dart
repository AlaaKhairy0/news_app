import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/data/api/model/articles_response/articles_response.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/data/api/model/sources_response/sources_response.dart';
import 'package:news_app/result.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '1f21307cd3974041b262c93711937b56';
  static const String sourcesEndPoint = '/v2/top-headlines/sources';
  static const String articlesEndPoint = '/v2/everything';

  static Future<Result<List<Source>>> getSources(String categoryId) async {
    Uri url = Uri.https(baseUrl, sourcesEndPoint, {
      'apiKey': apiKey,
      'category': categoryId,
    });
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == 'ok') {
        return Success(data: sourcesResponse.sources ?? []);
      } else {
        return ServerError(
            code: sourcesResponse.code ?? '',
            message: sourcesResponse.message ?? '');
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  static Future<Result<List<Article>>> getArticles(
    String sourceId,
  ) async {
    Uri url = Uri.https(baseUrl, articlesEndPoint, {
      'apiKey': apiKey,
      'sources': sourceId,
    });

    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == 'ok') {
        return Success(data: articlesResponse.articles ?? []);
      } else {
        return ServerError(
            code: articlesResponse.code ?? '',
            message: articlesResponse.message ?? '');
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  static Future<Result<List<Article>>> searchArticles(
      {String query = ''}) async {
    Uri url = Uri.https(baseUrl, articlesEndPoint, {
      'apiKey': apiKey,
      'q': query,
    });

    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == 'ok') {
        return Success(data: articlesResponse.articles ?? []);
      } else {
        return ServerError(
            code: articlesResponse.code ?? '',
            message: articlesResponse.message ?? '');
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }
}