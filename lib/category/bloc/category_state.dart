part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

//state to emit whenever someone clicks on the category section
class CategoryClickedActionState extends CategoryState{
  final String categoryName;
  CategoryClickedActionState({required this.categoryName});
}


//=======================================================//
// these states are only for the category article list page where the articles of a specific categories are listed

// 1. suppose the category news articles are getting loaded 
class CategoryDataLoadingState extends CategoryState {}

// 2. suppose the category news articles are loaded successfully
class CategoryDataLoadedState extends CategoryState {
  final List<ArticleModel> articleList;

  CategoryDataLoadedState({required this.articleList});
}