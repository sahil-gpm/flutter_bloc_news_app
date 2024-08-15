part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}



//if data is loading
class HomeDataLoadingState extends HomeState{}



//if the data is loaded successfully
class HomeDataLoadedState extends HomeState{
  final List<ArticleModel> articleList;
  HomeDataLoadedState({required this.articleList});
}



//error event
class HomeDataLoadingErrorState extends HomeState{}
