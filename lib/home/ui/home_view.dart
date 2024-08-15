import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews/home/bloc/home_bloc.dart';
import 'package:flutternews/theme/mythemes.dart';
import 'package:flutternews/widgets/components/bottom_navigation_widget.dart';
import 'package:flutternews/widgets/components/gradient_container_widget.dart';
import 'package:flutternews/widgets/helpers/loading_animation_widget.dart';
import 'package:flutternews/widgets/tiles/news_article_tile_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeDataLoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Wrapping the UI in bloc consumer
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,

      // When to listen and perform an action
      listener: (context, state) {},

      // Builder to build the UI
      builder: (context, state) {
        switch (state.runtimeType) {
          // Loading state to show the loading animation
          case HomeDataLoadingState:
            return const LoadingWidget();

          //displaying data of the loading ends
          case HomeDataLoadedState:
            // Getting the state data
            final homeDataLoadedState = state as HomeDataLoadedState;

            return Scaffold(
              bottomNavigationBar: const BottomNavigation(),
              body: SafeArea(
                // Padding
                child: Padding(
                  padding: const EdgeInsets.all(22),

                  // Column
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      // Column children
                      children: [
                        // Text
                        Text(
                          "Discover",
                          style: MyTheme.myTheme.textTheme.displayLarge,
                        ),

                        // Text
                        Text(
                          "Read your favourite news articles in just one click",
                          style: MyTheme.myTheme.textTheme.displaySmall,
                        ),

                        // Gradient container
                        const GradientContainer(),
                        const SizedBox(
                          height: 25,
                        ),

                        // Text
                        Text(
                          "Top headlines from India",
                          style: MyTheme.myTheme.textTheme.labelMedium,
                        ),

                        // Mapping the ListView data
                        SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: homeDataLoadedState.articleList.length,
                            itemBuilder: (context, index) {
                              // Return your news article tile widget here based on index
                              return NewsArticleTile(
                                author: homeDataLoadedState //author
                                    .articleList[index]
                                    .author,
                                title: homeDataLoadedState //title
                                    .articleList[index]
                                    .title,
                                date: homeDataLoadedState //date
                                    .articleList[index]
                                    .publishedAt,
                                imageUrl: homeDataLoadedState //imageUrl
                                    .articleList[index]
                                    .imageUrl,
                                articleUrl: homeDataLoadedState
                                    .articleList[index].articleUrl,
                              )

                                  //adding the required animations at the end
                                  .animate()
                                  .slideX(
                                      begin: -10,
                                      end: 0,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.fastEaseInToSlowEaseOut,
                                      delay:
                                          Duration(milliseconds: 200 * index));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );

          //for default just render an empty container
          default:
            return Container();
        }
      },
    );
  }
}
