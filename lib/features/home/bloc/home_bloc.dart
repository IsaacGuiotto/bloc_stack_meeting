import 'package:bloc/bloc.dart';
import 'package:bloc_stack_meeting/core/data/repositories/repository_impl.dart';
import 'package:equatable/equatable.dart';

import '../../../core/domain/repositories/repository.dart';
import '../../../core/handlers/result/result.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Repository repo = RepositoryImpl();

  HomeBloc() : super(HomeInitial()) {
    on<FetchHomeList>(onFetchHomeList);
  }

  onFetchHomeList(FetchHomeList event, emit) async {
    emit(HomeLoading());
    final Result<String, List<String>> result = await repo.fetchHomeList();

    if (result.hasError) {
      emit(HomeError(error: result.error!));
      return;
    }

    emit(HomeList(homeList: result.data!));
  }
}
