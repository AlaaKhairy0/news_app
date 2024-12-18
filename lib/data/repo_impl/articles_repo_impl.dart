import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/data/data_source_contract/articles_data_source.dart';
import 'package:news_app/repo/articles_repo.dart';
import 'package:news_app/result.dart';

class ArticlesRepoImpl extends ArticlesRepo{
  ArticlesDataSource dataSource;
  ArticlesRepoImpl({required this.dataSource});

  @override
  Future<Result<List<Article>>> getArticles(String sourceId) {
    return dataSource.getArticles(sourceId);
  }

}