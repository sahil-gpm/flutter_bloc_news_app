import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/category/repo/get_category_news_from_india.dart';
import 'package:flutternews/model/article_model.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    //handling the category clicked event
    on<ClickedOnCategoryEvent>(_clickedOnCategoryEvent);

    //handling the category article data loading event
    on<CategoryDataLoadingEvent>(_categoryDataLoadingEvent);
  }

  //method to handle the click
  FutureOr<void> _clickedOnCategoryEvent(
      ClickedOnCategoryEvent event, Emitter<CategoryState> emit) {
    //emiting the state to navigate to another page
    emit(CategoryClickedActionState(categoryName: event.categoryName));
  }

  //method to handle the data loading event of specific category articles
  FutureOr<void> _categoryDataLoadingEvent(
      CategoryDataLoadingEvent event, Emitter<CategoryState> emit)async {
    emit(CategoryDataLoadingState());

    //call the data loading method and emit the data loaded state
     var result = await GetCategoricalArticles.getIndianHeadlines(event.categoryName);
      
    //if the result is not false then --> 
    if(result != false){
      //emit the data successfully loaded state : op
      emit(CategoryDataLoadedState(articleList: result["articleList"]));
    }
  }
}
