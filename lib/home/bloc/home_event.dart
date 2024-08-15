part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

//events to throw 


//The home page is going to fetch the top headlines from india
//when the data is loading
class HomeDataLoadingEvent extends HomeEvent{}



//when the data is loaded
class HomeDataLoadedEvent extends HomeEvent{}



//when the data is not loaded and an error comes there
class HomeDataLoadedErrorEvent extends HomeEvent{}


//navigate to web view whenever the read more button is clicked