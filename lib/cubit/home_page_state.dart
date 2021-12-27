part of '../cubit/home_page_cubit.dart';

@immutable
abstract class HomeScreenState extends Equatable{

  const HomeScreenState();

  @override
  List<Object?> get props => [];
}

class HomeScreenInitial extends HomeScreenState{
  const HomeScreenInitial();

  @override
  List<Object?> get props => [];
}

class HomeScreenDataLoaded extends HomeScreenState {




  @override
  List<Object?> get props => [];

}


class EventScreenPageChanged extends HomeScreenState{

  @override
  List<Object?> get props => [] ;

}