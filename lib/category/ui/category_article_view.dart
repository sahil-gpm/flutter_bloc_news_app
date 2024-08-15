import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews/category/bloc/category_bloc.dart';
import 'package:flutternews/theme/mythemes.dart';
import 'package:flutternews/widgets/components/bottom_navigation_widget.dart';
import 'package:flutternews/widgets/helpers/loading_animation_widget.dart';
import 'package:flutternews/widgets/tiles/news_article_tile_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CategoryArticleView extends StatefulWidget {
  final String categoryName;
  const CategoryArticleView({super.key, required this.categoryName});

  @override
  State<CategoryArticleView> createState() => _CategoryArticleViewState();
}

class _CategoryArticleViewState extends State<CategoryArticleView> {
  final CategoryBloc categoryBloc = CategoryBloc();

  @override
  void initState() {
    //pass the loading state as soon as the page gets loaded
    categoryBloc
        .add(CategoryDataLoadingEvent(categoryName: widget.categoryName));
    super.initState();
  }

  @override
  void dispose() {
    categoryBloc.close(); // Close the bloc when the state is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      //bloc
      bloc: categoryBloc,

      //listener to perform operation other than ui building
      listener: (context, state) {},

      //builder to build the ui
      builder: (context, state) {
        switch (state.runtimeType) {
          //state when the category data is loading
          case CategoryDataLoadingState:
            return const LoadingWidget();

          //state when the category data is loaded
          case CategoryDataLoadedState:
            final categoryDataLoadedState = state as CategoryDataLoadedState;

            return Scaffold(
              bottomNavigationBar: const BottomNavigation(),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Column children
                      children: [
                        // Text
                        GradientText(
                          "${widget.categoryName} related articles",
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600,height: 1),
                          colors: [
                            MyTheme.myTheme.colorScheme.primary,
                            MyTheme.myTheme.colorScheme.secondary,
                            MyTheme.myTheme.colorScheme.tertiary,
                          ],
                        ),

                        //sized box
                        const SizedBox(
                          height: 9,
                        ),

                        // Text
                        Text(
                          "Read all articles related to the category of ${widget.categoryName.toLowerCase()} and explore more categories as per your personal interests, preferences and enjoy reading.",
                          style: MyTheme.myTheme.textTheme.displaySmall,
                        ),

                        //mapping the articles
                        SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                categoryDataLoadedState.articleList.length,
                            itemBuilder: (context, index) {
                              // Return your news article tile widget here based on index
                              return NewsArticleTile(
                                      author: categoryDataLoadedState
                                          .articleList[index].author,
                                      title: categoryDataLoadedState
                                          .articleList[index].title,
                                      date: categoryDataLoadedState
                                          .articleList[index].publishedAt,
                                      imageUrl: categoryDataLoadedState
                                          .articleList[index]
                                          .imageUrl, //imageUrl
                                      articleUrl: categoryDataLoadedState
                                          .articleList[index].articleUrl)

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
                      ]),
                ),
              )),
            );

          // default container to be returned
          default:
            return Container();
        }
      },
    );
  }
}
