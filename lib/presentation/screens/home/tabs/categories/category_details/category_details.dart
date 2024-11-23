import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/data_models/category_dm.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_details/widgets/sources_tab_widget/sources_tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.categoryItem});

  CategoryDM categoryItem;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.categoryItem.backendId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: ColorsManager.green,
          ));
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        List<Source> sourcesList = snapshot.data?.sources ?? [];
        return SourcesTabWidget(sources: sourcesList);
      },
    );
  }


}
