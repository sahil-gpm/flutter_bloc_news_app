import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutternews/home/repo/get_india_headlines_repo.dart';
import 'package:flutternews/model/article_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeDataLoadingEvent>(_homeDataLoadingEvent);
  }


  //method to load and display the data on home page
  FutureOr<void> _homeDataLoadingEvent(
      HomeDataLoadingEvent event, Emitter<HomeState> emit)async {

    //state to show the data loading screen
    emit(HomeDataLoadingState());
    var result = await GetIndiaHeadlines.getIndianHeadlines();
      
    //if the result is not false then --> 
    if(result != false){
      //emit the data successfully loaded state : op
      emit(HomeDataLoadedState(articleList: result["articleList"]));
    }
  }
}
