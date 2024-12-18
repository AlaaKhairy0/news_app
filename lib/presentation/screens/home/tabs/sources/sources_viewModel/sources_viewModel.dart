import 'package:news_app/base/base_viewModel/base_viewModel.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/domain/usecases/sources_usecase.dart';
import 'package:news_app/result.dart';

import '../../../../../../base/base_state/base_state.dart';
import '../../../../../../domain/repo/sources_repo.dart';

class SourcesViewModel extends BaseViewModel<List<SourceEntity>> {
  GetSourcesUseCase usecase;
  SourcesViewModel({required this.usecase}) : super(state: LoadingState());

  Future<void> getSourcesByCategoryId(String categoryId) async {
    emit(LoadingState());
    var response = await usecase.execute(categoryId);
    switch(response){

    case Success<List<SourceEntity>>():
    emit(SuccessState(data: response.data));
    case ServerError<List<SourceEntity>>():
    emit(ErrorState(serverError: response));
    case Error<List<SourceEntity>>():
    emit(ErrorState(error: response));
    }
  }
}

// sealed class SourcesState {}
//
// class SourcesSuccessState extends SourcesState {
//   List<Source> sources;
//
//   SourcesSuccessState({required this.sources});
// }
//
// class SourcesLoadingState extends SourcesState {
//   String? loadingMessage;
//
//   SourcesLoadingState({this.loadingMessage});
// }
//
// class SourcesErrorState extends SourcesState {
//   ServerError? serverError;
//   Error? error;
//
//   SourcesErrorState({this.serverError, this.error});
// }
