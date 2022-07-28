part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class FetchHomeList extends HomeEvent {
  FetchHomeList();
  @override
  List<Object?> get props => [];
}
