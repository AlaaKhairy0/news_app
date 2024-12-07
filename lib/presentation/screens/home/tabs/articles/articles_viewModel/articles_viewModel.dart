import 'package:flutter/material.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/base/base_viewModel/base_viewModel.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/result.dart';

class ArticlesViewModel extends BaseViewModel<List<Article>> {
  ArticlesViewModel() : super(state: LoadingState());

  Future<void> getArticlesBySourceId(String sourceId) async {
    emit(LoadingState());
    var response = await ApiManager.getArticles(sourceId);

    switch (response) {
      case Success<List<Article>>():
        emit(SuccessState(data: response.data));
      case ServerError<List<Article>>():
        emit(ErrorState(serverError: response));
      case Error<List<Article>>():
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
