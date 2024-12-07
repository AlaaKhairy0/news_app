import 'package:flutter/material.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/base/base_viewModel/base_viewModel.dart';
import 'package:news_app/result.dart';

import '../../../../data/api/api_manager/api_manager.dart';
import '../../../../data/api/model/articles_response/article.dart';

class CustomSearchDelegateViewModel extends BaseViewModel<List<Article>> {
  CustomSearchDelegateViewModel() : super(state: LoadingState());

  Future<void> getArticlesByQuery(String query) async {
    emit(LoadingState());
    var response = await ApiManager.searchArticles(query: query);
    switch (response) {
      case Success<List<Article>>():
        emit(SuccessState(data: response.data));
      case ServerError<List<Article>>():
        emit(ErrorState(serverError: response));
      case Error<List<Article>>():
        emit(ErrorState(error: response));
    }
    // if(response.status == 'ok'){
    //   articles = response.articles;
    // }else{
    //   errorMessage = response.message;
    // }
    // notifyListeners();
  }
}
