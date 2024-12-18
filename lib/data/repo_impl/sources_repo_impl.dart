import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/data/data_source_contract/sources_data_source.dart';
import 'package:news_app/repo/sources_repo.dart';
import 'package:news_app/result.dart';

class SourcesRepoImpl extends SourcesRepo{
  SourcesDataSource dataSource;
  SourcesRepoImpl({required this.dataSource});
  @override
  Future<Result<List<Source>>> getSources(String categoryId) {
    return dataSource.getSources(categoryId);
  }

}