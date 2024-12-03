import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home/custom_search_delegate/custom_search_delegate_viewModel.dart';
import 'package:provider/provider.dart';
import '../../../../core/assets_manager.dart';
import '../../../../core/colors_manager.dart';
import '../tabs/categories/category_details/widgets/articles_list_widget/articles_list_widget.dart';

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
            builder: (context, value, child) {
              if (viewModel.isLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.green,
                  ),
                );
              }
              if(query == ''){
                return Container();
              }
              if (viewModel.errorMessage != null ) {
                return Center(child: Text(viewModel.errorMessage!));
              }
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {},
                      child: ArticlesListWidget.buildArticleItem(context,
                          article: viewModel.articles![index])),
                  itemCount: viewModel.articles!.length,
                ),
              );
            },
          ),
        )
        );
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
