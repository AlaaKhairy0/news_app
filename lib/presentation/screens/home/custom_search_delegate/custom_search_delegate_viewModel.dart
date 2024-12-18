import 'package:flutter/material.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/base/base_viewModel/base_viewModel.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repo/search_articles_repo.dart';
import 'package:news_app/result.dart';

class CustomSearchDelegateViewModel extends BaseViewModel<List<ArticleEntity>> {
  SearchArticlesRepo repo;
  CustomSearchDelegateViewModel({required this.repo}) : super(state: LoadingState());

  Future<void> getArticlesByQuery(String query) async {
    emit(LoadingState());
    var response = await repo.searchArticles(query);
    switch (response) {
      case Success<List<ArticleEntity>>():
        emit(SuccessState(data: response.data));
      case ServerError<List<ArticleEntity>>():
        emit(ErrorState(serverError: response));
      case Error<List<ArticleEntity>>():
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
