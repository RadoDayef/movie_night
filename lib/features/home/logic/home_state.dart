part of 'home_cubit.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  List<HomeCategoryModel> data;

  HomeSuccess(this.data);
}

class HomeFailure extends HomeState {
  String message;

  HomeFailure(this.message);
}
