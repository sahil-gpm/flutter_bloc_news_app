part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

//if someone clicked the category section of the categories
class ClickedOnCategoryEvent extends CategoryEvent {
  final String categoryName;

  //event to handle the button click
  ClickedOnCategoryEvent({required this.categoryName});
}

//=======================================================//
// these events are only for the category article list page where the articles of a specific categories are listed

// 1. suppose the category news articles are getting loaded 
class CategoryDataLoadingEvent extends CategoryEvent {
  final String categoryName;
  CategoryDataLoadingEvent({required this.categoryName});
}

// 2. suppose the category news articles are loaded successfully
class CategoryDataLoadedEvent extends CategoryEvent {}
