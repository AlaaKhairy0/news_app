import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/data/data_source_contract/articles_data_source.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/result.dart';

import '../../domain/repo/articles_repo.dart';

class ArticlesRepoImpl extends ArticlesRepo {
  ArticlesDataSource dataSource;

  ArticlesRepoImpl({required this.dataSource});

  @override
  Future<Result<List<ArticleEntity>>> getArticles(String sourceId) async {
    var response = await dataSource.getArticles(sourceId);
    switch (response) {
      case Success<List<Article>>():
        return Success(
            data: response.data
                .map((article) => article.toArticleEntity())
                .toList());
      case ServerError<List<Article>>():
        return ServerError(code: response.code, message: response.message);
      case Error<List<Article>>():
        return Error(exception: response.exception);
    }
  }
}
