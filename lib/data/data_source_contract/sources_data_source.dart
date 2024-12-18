import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/result.dart';

abstract class SourcesDataSource{
  Future<Result<List<Source>>> getSources(String categoryId);
}