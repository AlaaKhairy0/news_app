import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/api/model/articles_response/articles_response.dart';
import 'package:news_app/data/api/model/sources_response/sources_response.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '1f21307cd3974041b262c93711937b56';
  static const String sourcesEndPoint = '/v2/top-headlines/sources';
  static const String articlesEndPoint = '/v2/everything';

  static Future<SourcesResponse> getSources(String categoryId) async{
    Uri url = Uri.https(baseUrl,sourcesEndPoint,{
      'apiKey':apiKey,
      'category':categoryId,
    });
    var response = await http.get(url);
    var json =jsonDecode(response.body);
    SourcesResponse sourcesResponse =SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
  static Future<ArticlesResponse> getArticles(String sourceId,)async{
    Uri url = Uri.https(baseUrl,articlesEndPoint,{
      'apiKey':apiKey,
      'sources':sourceId,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
  static Future<ArticlesResponse> searchArticles({String query = ''})async{
    Uri url = Uri.https(baseUrl,articlesEndPoint,{
      'apiKey':apiKey,
      'q':query,

    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}
