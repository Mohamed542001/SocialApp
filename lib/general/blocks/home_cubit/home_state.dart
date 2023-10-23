part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoadingState extends HomeState{}
class HomeSuccessState extends HomeState{}
class HomeErrorState extends HomeState{
  final String error;

  HomeErrorState(this.error);

}


class GetUserSuccessState extends HomeState{}
class GetUserErrorState extends HomeState{
  final String error;

  GetUserErrorState(this.error);

}

class HomeChangeBottomNavState extends HomeState{}
class HomeAddPostState extends HomeState{}

