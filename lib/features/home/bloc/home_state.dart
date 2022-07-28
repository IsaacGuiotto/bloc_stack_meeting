part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  HomeInitial();
  @override
  List<Object?> get props => [];
}

class HomeError extends HomeState {
  final String error;
  HomeError({required this.error});
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  HomeLoading();

  @override
  List<Object?> get props => [];
}

class HomeList extends HomeState {
  final List<String> homeList;
  HomeList({required this.homeList});
  @override
  List<Object?> get props => [];
}
