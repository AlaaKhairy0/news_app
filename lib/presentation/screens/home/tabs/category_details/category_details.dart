import 'package:flutter/material.dart';
import 'package:news_app/data_models/category_dm.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/sources_view/sources_view.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.categoryItem});

  CategoryDM categoryItem;

  @override
  Widget build(BuildContext context) {
    return SourcesView(categoryItem: categoryItem);
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
