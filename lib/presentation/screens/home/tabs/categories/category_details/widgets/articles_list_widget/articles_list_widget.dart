import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';

import '../../../../../../../../data/api/model/sources_response/source.dart';

class ArticlesListWidget extends StatelessWidget {
  ArticlesListWidget({super.key, required this.source});

  Source source;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: ColorsManager.green),
          );
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        List<Article> articlesList = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
                onTap: () {},
                child: buildArticleItem(article: articlesList[index])),
            itemCount: articlesList.length,
          ),
        );
      },
    );
  }

  Widget buildArticleItem({required Article article}) {
    return Padding(
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
    );
  }
}
