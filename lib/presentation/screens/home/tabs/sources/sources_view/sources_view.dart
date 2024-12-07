import 'package:flutter/material.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data_models/category_dm.dart';
import 'package:news_app/presentation/common/error_state_widget.dart';
import 'package:news_app/presentation/common/loading_state_widget.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/sources_viewModel/sources_viewModel.dart';
import 'package:provider/provider.dart';
import '../widgets/sources_tab_widget/sources_tab_widget.dart';

class SourcesView extends StatefulWidget {
  SourcesView({super.key, required this.categoryItem});

  CategoryDM categoryItem;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  var viewModel = SourcesViewModel();

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
      child: Consumer<SourcesViewModel>(
        builder: (context, viewModel, child) {
          var state = viewModel.state;
          switch (state) {
            case SuccessState():
              return SourceTabs(sources: state.data);
            case LoadingState():
              return LoadingWidget(
                loadingMessage: 'Plz, wait...',
              );
            case ErrorState():
              return ErrorStateWidget(
                error: state.error,
                serverError: state.serverError,
                retryTxt: 'Try Again',
                retryButtonAction:() {
                  viewModel.getSourcesByCategoryId(widget.categoryItem.backendId);
                } ,
              );
          }

          // if(viewModel.isLoading){
          //   return Center(child: CircularProgressIndicator(color: ColorsManager.green,),);
          // }
          // if(viewModel.errorMessage != null ){
          //   return Center(child: Text(viewModel.errorMessage!));
          // }
          // return SourceTabs(sources: viewModel.sources!);
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
