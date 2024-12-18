import 'package:news_app/domain/repo/sources_repo.dart';

import '../../result.dart';
import '../entities/source_entity.dart';

class GetSourcesUseCase{
  SourcesRepo repo;
  GetSourcesUseCase({required this.repo});
  Future<Result<List<SourceEntity>>> execute(String categoryId){
    return repo.getSources(categoryId);
  }
}