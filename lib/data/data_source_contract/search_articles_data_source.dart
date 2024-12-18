import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/result.dart';

abstract class SearchArticlesDataSource{
  Future<Result<List<Article>>>searchArticles(String query);
}