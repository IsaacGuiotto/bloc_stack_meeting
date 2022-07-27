// part 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeState.initial());
//   final Repository repo = RepositoryImpl();
//
//   onFetchHomeList() async {
//     emit(state.copyWith(error: null));
//     emit(state.copyWith(isLoading: true));
//     final Result<String, List<String>> result = await repo.fetchHomeList();
//
//     if (result.hasError) {
//       emit(state.copyWith(error: result.error));
//       emit(state.copyWith(isLoading: false));
//       return;
//     }
//
//     emit(state.copyWith(homeList: result.data));
//     emit(state.copyWith(isLoading: false));
//   }
// }
