import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/category/ui/category_selection_view.dart';
import 'package:flutternews/home/ui/home_view.dart';
import 'package:flutternews/widgets/helpers/icon_widget.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconWidget(
                icon: Icon(CupertinoIcons.home),
                navigationComponent: HomeView(),
              ),
              IconWidget(
                icon: Icon(CupertinoIcons.list_bullet),
                navigationComponent: CategorySelectionView(),
              ),
              IconWidget(
                icon: Icon(CupertinoIcons.globe),
                navigationComponent: HomeView(),
              ),
              IconWidget(
                icon: Icon(CupertinoIcons.heart),
                navigationComponent: HomeView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
