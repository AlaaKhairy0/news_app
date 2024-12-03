import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/routes_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_details/widgets/articles_list_widget/articles_viewModel.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../data/api/model/sources_response/source.dart';

class ArticlesListWidget extends StatefulWidget {
  ArticlesListWidget({super.key, required this.source});

  Source source;

  @override
  State<ArticlesListWidget> createState() => _ArticlesListWidgetState();

  static Widget buildArticleItem
  (
  context,
  {required Article article, required}) {
  return InkWell(
  onTap: () {
  Navigator.pushNamed(
  context,
  RoutesManager.articleDetails,
  arguments: article,
  );
  },
  child: Padding(
  padding: REdgeInsets.all(12.0),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
  ClipRRect(
  borderRadius: BorderRadius.all(Radius.circular(5.r)),
  child: CachedNetworkImage(
  imageUrl: article.urlToImage ?? '',
  placeholder: (context, url) => Center(
  child: CircularProgressIndicator(
  color: ColorsManager.green,
  )),
  errorWidget: (context, url, error) => Icon(Icons.error),
  ),
  ),
  SizedBox(
  height: 6.h,
  ),
  Text(
  article.source?.name ?? '',
  style: AppStyle.articleSourceName,
  ),
  SizedBox(
  height: 6.h,
  ),
  Text(
  article.title ?? '',
  style: AppStyle.articleTitle,
  ),
  Text(
  article.publishedAt ?? '',
  style: AppStyle.articlePublishedDate,
  textAlign: TextAlign.end,
  ),
  ],
  ),
  ),
  );
  }
}

class _ArticlesListWidgetState extends State<ArticlesListWidget> {
  var viewModel = ArticlesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getArticlesBySourceId(widget.source.id?? '');
  }
  @override
  void didUpdateWidget(covariant ArticlesListWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    viewModel.getArticlesBySourceId(widget.source.id?? '');

  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, value, child) {
          if (viewModel.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: ColorsManager.green,),);
          }
          if (viewModel.errorMessage != null) {
            return Center(child: Text(viewModel.errorMessage!),);
          }
          return Expanded(
            child: ListView.builder(
              itemCount: viewModel.articles!.length,
              itemBuilder: (BuildContext context, int index) {
                return ArticlesListWidget.buildArticleItem(
                    context, article: viewModel.articles![index]);
              },
            ),
          );
        },
      ),
    );
    //   FutureBuilder(
    //   future: ApiManager.getArticles(source.id ?? ''),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(color: ColorsManager.green),
    //       );
    //     }
    //     if (snapshot.hasError) {
    //       return Text(snapshot.error.toString());
    //     }
    //     List<Article> articlesList = snapshot.data?.articles ?? [];
    //     return Expanded(
    //       child: ListView.builder(
    //         itemBuilder: (context, index) => InkWell(
    //             onTap: () {},
    //             child: buildArticleItem(context, article: articlesList[index])),
    //         itemCount: articlesList.length,
    //       ),
    //     );
    //   },
    // );
  }
}
