import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/data/data_source_contract/sources_data_source.dart';
import 'package:news_app/result.dart';

class SourcesDataSourceImpl extends SourcesDataSource{
  ApiManager apiManager;
  SourcesDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<Source>>> getSources(String categoryId)async {
    var response =await apiManager.getSources(categoryId);
    switch(response){
      case Success<List<Source>>():
        return Success(data: response.data);
      case ServerError<List<Source>>():
        return ServerError(code: response.code, message: response.message);
      case Error<List<Source>>():
        return Error(exception: response.exception);
    }
  }

}