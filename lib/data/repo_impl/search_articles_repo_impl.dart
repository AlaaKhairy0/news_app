import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/data/data_source_contract/search_articles_data_source.dart';
import 'package:news_app/domain/entities/article_entity.dart';

import 'package:news_app/result.dart';

import '../../domain/repo/search_articles_repo.dart';

class SearchArticlesRepoImpl extends SearchArticlesRepo{
  SearchArticlesDataSource dataSource;
  SearchArticlesRepoImpl({required this.dataSource});
  @override
  Future<Result<List<ArticleEntity>>> searchArticles(String query) async{
    var result = await dataSource.searchArticles(query);
    switch(result){

      case Success<List<Article>>():
        return Success(data: result.data.map((article) =>article.toArticleEntity() ,).toList());
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Article>>():
        return Error(exception: result.exception);
    }
  }
}