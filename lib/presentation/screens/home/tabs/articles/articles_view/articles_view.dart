import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/di.dart';
import 'package:news_app/core/routes_manager.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/usecases/articles_usecase.dart';
import 'package:news_app/presentation/common/error_state_widget.dart';
import 'package:news_app/presentation/common/loading_state_widget.dart';
import 'package:provider/provider.dart';
import '../articles_viewModel/articles_viewModel.dart';

class ArticlesView extends StatefulWidget {
  ArticlesView({super.key, required this.source});

  SourceEntity source;

  @override
  State<ArticlesView> createState() => _ArticlesViewState();

  static Widget buildArticleItem(context, {required ArticleEntity article}) {
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

class _ArticlesViewState extends State<ArticlesView> {
  var viewModel =
      ArticlesViewModel(usecase: GetArticlesUseCase(repo: getArticlesRepo()));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getArticlesBySourceId(widget.source.id ?? '');
  }

  @override
  void didUpdateWidget(covariant ArticlesView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.getArticlesBySourceId(widget.source.id ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, viewModel, child) {
          var state = viewModel.state;
          switch (state) {
            case LoadingState():
              return LoadingWidget(
                loadingMessage: 'Plz, Wait...',
              );
            case SuccessState():
              return Expanded(
                child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ArticlesView.buildArticleItem(context,
                        article: state.data[index]);
                  },
                ),
              );
            case ErrorState():
              return ErrorStateWidget(
                error: state.error,
                serverError: state.serverError,
                retryTxt: 'Try Again',
                retryButtonAction: () {
                  viewModel.getArticlesBySourceId(widget.source.id ?? '');
                },
              );
          }
          // if (viewModel.isLoading) {
          //   return Center(
          //     child: CircularProgressIndicator(
          //       color: ColorsManager.green,
          //     ),
          //   );
          // }
          // if (viewModel.errorMessage != null) {
          //   return Center(
          //     child: Text(viewModel.errorMessage!),
          //   );
          // }
          // return Expanded(
          //   child: ListView.builder(
          //     itemCount: viewModel.articles!.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return ArticlesView.buildArticleItem(context,
          //           article: viewModel.articles![index]);
          //     },
          //   ),
          // );
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
