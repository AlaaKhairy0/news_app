import 'package:flutter/material.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/data_models/category_dm.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_details/category_details_viewmodel.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_details/widgets/sources_tab_widget/sources_tab_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.categoryItem});

  CategoryDM categoryItem;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryItem.backendId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, value, child) {
          if(viewModel.isLoading){
            return Center(child: CircularProgressIndicator(color: ColorsManager.green,),);
          }
          if(viewModel.errorMessage != null ){
            return Center(child: Text(viewModel.errorMessage!));
          }
          return SourcesTabWidget(sources: viewModel.sources!);
        },
      ),
    );
    //   FutureBuilder(
    //   future: ApiManager.getSources(widget.categoryItem.backendId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //           child: CircularProgressIndicator(
    //         color: ColorsManager.green,
    //       ));
    //     }
    //     if (snapshot.hasError) {
    //       return Text(snapshot.error.toString());
    //     }
    //     List<Source> sourcesList = snapshot.data?.sources ?? [];
    //     return SourcesTabWidget(sources: sourcesList);
    //   },
    // );
  }
}
