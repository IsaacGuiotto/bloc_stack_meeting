part of 'home_bloc.dart';

// class HomeState extends Equatable {
//   final List<String> homeList;
//   final String? error;
//   final bool isLoading;
//
//   const HomeState(
//       {required this.homeList, this.error, required this.isLoading});
//   HomeState.initial()
//       : homeList = [],
//         error = null,
//         isLoading = false;
//
//   copyWith({List<String>? homeList, String? error, bool? isLoading}) {
//     return HomeState(
//       homeList: homeList ?? this.homeList,
//       error: error ?? this.error,
//       isLoading: isLoading ?? this.isLoading,
//     );
//   }
//
//   @override
//   List<Object?> get props => [homeList, error, isLoading];
// }

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeError extends HomeState {
  final String error;
  const HomeError({required this.error});
  @override
  List<Object?> get props => [error];
}

class HomeList extends HomeState {
  final List<String> homeList;
  const HomeList({required this.homeList});
  @override
  List<Object?> get props => [homeList];
}

class HomeLoading extends HomeState {
  const HomeLoading();
  @override
  List<Object?> get props => [];
}
