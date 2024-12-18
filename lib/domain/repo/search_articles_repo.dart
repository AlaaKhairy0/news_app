import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/result.dart';

abstract class SearchArticlesRepo{
  Future<Result<List<ArticleEntity>>> searchArticles(String query);
}