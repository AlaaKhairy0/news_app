import 'package:news_app/domain/repo/articles_repo.dart';

import '../../result.dart';
import '../entities/article_entity.dart';

class GetArticlesUseCase{
  ArticlesRepo repo;
  GetArticlesUseCase({required this.repo});
  Future<Result<List<ArticleEntity>>> execute(String sourceId){
    return repo.getArticles(sourceId);
  }
}