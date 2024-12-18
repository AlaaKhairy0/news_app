import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/result.dart';

abstract class SourcesRepo{
  Future<Result<List<SourceEntity>>> getSources(String categoryId);
}