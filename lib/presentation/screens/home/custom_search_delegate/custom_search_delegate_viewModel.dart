import 'package:flutter/material.dart';

import '../../../../data/api/api_manager/api_manager.dart';
import '../../../../data/api/model/articles_response/article.dart';

class CustomSearchDelegateViewModel extends ChangeNotifier {
  List<Article>? articles;

  String? errorMessage;
  bool isLoading = false;

  Future<void> getArticlesByQuery(String query) async {
    try{
      isLoading = true;
      notifyListeners();
      var response = await ApiManager.searchArticles(query: query );
      isLoading = false;
      if(response.status == 'ok'){
        articles = response.articles;
      }else{
        errorMessage = response.message;
      }
      notifyListeners();
    }catch(e){
      isLoading = false;
      errorMessage = 'Plz, Check Internet Connection';
      notifyListeners();
    }
  }
}