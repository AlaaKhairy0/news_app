import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/data/data_source_contract/search_articles_data_source.dart';
import 'package:news_app/result.dart';

class SearchArticlesDataSourceImpl extends SearchArticlesDataSource{
  ApiManager apiManager;
  SearchArticlesDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<Article>>> searchArticles(String query)async {
    var result =await apiManager.searchArticles(query: query);
    switch(result){
      case Success<List<Article>>():
        return Success(data: result.data);
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Article>>():
        return Error(exception: result.exception);
    }
  }
}