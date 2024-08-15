import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews/category/bloc/category_bloc.dart';
import 'package:flutternews/category/ui/category_article_view.dart';
import 'package:flutternews/theme/mythemes.dart';
import 'package:flutternews/widgets/components/bottom_navigation_widget.dart';
import 'package:flutternews/widgets/tiles/category_tile_widget.dart';

// ignore: must_be_immutable
class CategorySelectionView extends StatelessWidget {
  const CategorySelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    //creating a category bloc instance
    final CategoryBloc categoryBloc = CategoryBloc();

    //list for categories
    List<String> categoryList = [
      "Cricket",
      "Football",
      "Politics",
      "Crypto",
      "Technology",
      "Music",
      "Gaming",
      "Anime",
      "Health",
      "Education",
      "Crime",
      "Weather"
    ];

    return BlocConsumer<CategoryBloc, CategoryState>(
      bloc: categoryBloc,

      listener: (context, state) {
        if (state is CategoryClickedActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  CategoryArticleView(categoryName: state.categoryName,)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          //bottom navigation
          bottomNavigationBar: const BottomNavigation(),

          //main content to be returned
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text
                Text(
                  "Categories",
                  style: MyTheme.myTheme.textTheme.displayLarge,
                ),

                // Text
                Text(
                  "Read about various categories as per your interests",
                  style: MyTheme.myTheme.textTheme.displaySmall,
                ),

                //categories mapping within the gridview
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 25,
                      ),
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            categoryBloc.add(ClickedOnCategoryEvent(categoryName: categoryList[index]));
                          },
                          child: CategoryTileWidget(
                                  categoryImagePath:
                                      "assets/images/cat${index + 1}.png",
                                  categoryName: categoryList[
                                      index]) //adding the required animations at the end

                              //adding the animate addon
                              .animate()

                              //adding fadeIn effect
                              .fadeIn(
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.decelerate)

                              //adding the shimmer effect
                              .shimmer(
                                  duration: const Duration(seconds: 3),
                                  curve: Curves.fastEaseInToSlowEaseOut),
                        );
                      }),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
