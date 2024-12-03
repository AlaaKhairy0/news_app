import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<Article>? articles;

  String? errorMessage;
  bool isLoading = false;

  Future<void> getArticlesBySourceId(String sourceId) async {
    try{
      isLoading = true;
      notifyListeners();
      var response = await ApiManager.getArticles(sourceId);
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
