import 'package:flutter/material.dart';
import 'package:flutternews/theme/mythemes.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.fourRotatingDots(color: Colors.black87, size: 40),
            const SizedBox(height: 20),
            Text(
              "Getting News for you 🕊️",
              style: MyTheme.myTheme.textTheme.displayMedium,
            )
          ],
        ),
      ),
    );
  }
}
