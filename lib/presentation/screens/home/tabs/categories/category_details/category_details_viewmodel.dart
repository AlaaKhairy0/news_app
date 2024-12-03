import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  List<Source>? sources;
  String? errorMessage;
  bool isLoading = false;
  Future<void> getSourcesByCategoryId(String categoryId) async {
    try{
      isLoading = true;
      notifyListeners();
      var response =await  ApiManager.getSources(categoryId);
      isLoading = false;
      if (response.status == 'ok'){
        sources = response.sources;
        notifyListeners();
      }
      else{
        errorMessage = response.message;
        notifyListeners();
      }
    }
    catch(e){
      isLoading = false;
      errorMessage = 'Check Internet Connection';
      notifyListeners();
    }

  }
}