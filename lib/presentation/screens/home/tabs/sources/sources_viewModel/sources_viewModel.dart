import 'package:news_app/base/base_viewModel/base_viewModel.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/repo/sources_repo.dart';
import 'package:news_app/result.dart';

import '../../../../../../base/base_state/base_state.dart';

class SourcesViewModel extends BaseViewModel<List<Source>> {
  SourcesRepo repo;
  SourcesViewModel({required this.repo}) : super(state: LoadingState());

  Future<void> getSourcesByCategoryId(String categoryId) async {
    emit(LoadingState());
    var response = await repo.getSources(categoryId);
    switch (response) {
      case Success<List<Source>>():
        emit(SuccessState(data: response.data));
      case ServerError<List<Source>>():
        emit(ErrorState(serverError: response));
      case Error<List<Source>>():
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
