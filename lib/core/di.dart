import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/data_source_impl/articles_data_source_impl.dart';
import 'package:news_app/data/data_source_impl/sources_data_source_impl.dart';
import 'package:news_app/data/repo_impl/articles_repo_impl.dart';
import 'package:news_app/data/repo_impl/sources_repo_impl.dart';

ArticlesRepoImpl getArticlesRepo() {
  return ArticlesRepoImpl(dataSource: getArticlesDtaSource());
}

ArticlesDataSourceImpl getArticlesDtaSource() {
  return ArticlesDataSourceImpl(apiManager: getApiManager());
}

ApiManager getApiManager() {
  return ApiManager();
}

SourcesRepoImpl getSourcesRepo() {
  return SourcesRepoImpl(dataSource: getSourcesDataSource());
}

SourcesDataSourceImpl getSourcesDataSource() {
  return SourcesDataSourceImpl(apiManager: getApiManager());
}
