import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/result.dart';

abstract class SourcesRepo{
  Future<Result<List<Source>>> getSources(String categoryId);
}