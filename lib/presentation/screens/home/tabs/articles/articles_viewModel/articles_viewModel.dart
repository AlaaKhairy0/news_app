import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/base/base_viewModel/base_viewModel.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/usecases/articles_usecase.dart';
import 'package:news_app/result.dart';

import '../../../../../../domain/repo/articles_repo.dart';

class ArticlesViewModel extends BaseViewModel<List<ArticleEntity>> {
  GetArticlesUseCase usecase;
  ArticlesViewModel({required this.usecase}) : super(state: LoadingState());

  Future<void> getArticlesBySourceId(String sourceId) async {
    emit(LoadingState());
    var response = await usecase.execute(sourceId);

    switch (response) {
      case Success<List<ArticleEntity>>():
        emit(SuccessState(data: response.data));
      case ServerError<List<ArticleEntity>>():
        emit(ErrorState(serverError: response));
      case Error<List<ArticleEntity>>():
        emit(ErrorState(error: response));
    }
    //   if(response.status == 'ok'){
    //     articles = response.articles;
    //   }else{
    //     errorMessage = response.message;
    //   }
    //   notifyListeners();
    // }catch(e){
    //   isLoading = false;
    //   errorMessage = 'Plz, Check Internet Connection';
    //   notifyListeners();
    // }
  }
}
