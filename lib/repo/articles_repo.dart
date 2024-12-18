import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/result.dart';

abstract class ArticlesRepo{
  Future<Result<List<Article>>> getArticles(String sourceId);
}