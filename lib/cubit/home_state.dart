part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangeNavBarState extends HomeState{}

class HomeGetProductSuccessState extends HomeState{}

class HomeGetProductErrorState extends HomeState{
  final String error;

  HomeGetProductErrorState(this.error);
}

class HomeRemoveFavoriteState extends HomeState{}

class HomeAddFavoriteState extends HomeState{}
