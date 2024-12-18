import 'package:flutter/material.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/presentation/screens/home/custom_search_delegate/custom_search_delegate_viewModel.dart';
import 'package:news_app/presentation/screens/home/tabs/articles/articles_view/articles_view.dart';
import 'package:provider/provider.dart';
import '../../../../core/assets_manager.dart';
import '../../../../core/colors_manager.dart';

class CustomSearchDelegate extends SearchDelegate<String> {



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var viewModel = CustomSearchDelegateViewModel();
    viewModel.getArticlesByQuery(query);
    return Container(
        decoration: BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AssetsManager.bgPattern),
          ),
        ),
        child: ChangeNotifierProvider.value(
          value: viewModel,
          child: Consumer<CustomSearchDelegateViewModel>(
            builder: (context, viewModel, child) {
              var state = viewModel.state;
              switch (state) {
                case LoadingState<List<Article>>():
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.green,
                    ),
                  );
                case SuccessState<List<Article>>():
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          InkWell(
                              onTap: () {},
                              child: ArticlesView.buildArticleItem(context,
                                  article: state.data[index])),
                      itemCount: state.data.length,
                    ),
                  );
                case ErrorState<List<Article>>():
                  return Text('handle it later');
              }
              // if (viewModel.isLoading) {
              //   return Center(
              //     child: CircularProgressIndicator(
              //       color: ColorsManager.green,
              //     ),
              //   );
              // }
              // if(query == ''){
              //   return Container();
              // }
              // if (viewModel.errorMessage != null ) {
              //   return Center(child: Text(viewModel.errorMessage!));
              // }
              // return Expanded(
              //   child: ListView.builder(
              //     itemBuilder: (context, index) => InkWell(
              //         onTap: () {},
              //         child: ArticlesView.buildArticleItem(context,
              //             article: viewModel.articles![index])),
              //     itemCount: viewModel.articles!.length,
              //   ),
              // );
            },
          ),
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetsManager.bgPattern),
        ),
      ),
    );
  }
}
