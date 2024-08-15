import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutternews/theme/mythemes.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                MyTheme.myTheme.colorScheme.primary,
                MyTheme.myTheme.colorScheme.secondary,
                MyTheme.myTheme.colorScheme.tertiary
              ])),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "FlutterNews",
              style: MyTheme.myTheme.textTheme.labelLarge,
            ),
            Text(
              "Introducing Flutter News, the go-to platform for all your news needs! Whether you're into global affairs, tech innovations, sports highlights, entertainment buzz, or financial insights. We bring you the latest updates tailored to your interests. ",
              style: MyTheme.myTheme.textTheme.labelSmall,
            )
          ],
        ),
      ),
    )

        //required animations
        .animate()
        .fade(duration: const Duration(seconds: 2))
        .shimmer(duration: const Duration(seconds: 2));
  }
}
