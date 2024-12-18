import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/data/data_source_contract/articles_data_source.dart';
import 'package:news_app/result.dart';

class ArticlesDataSourceImpl extends ArticlesDataSource{
  ApiManager apiManager;
  ArticlesDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<Article>>> getArticles(String sourceId)async {
    var response = await apiManager.getArticles(sourceId);
    switch(response){

      case Success<List<Article>>():
        return Success(data: response.data);
      case ServerError<List<Article>>():
        return ServerError(code: response.code, message: response.message);
      case Error<List<Article>>():
        return Error(exception: response.exception);
    }
  }

}