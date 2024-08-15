import 'package:flutter/material.dart';
import 'package:flutternews/home/ui/home_view.dart';
import 'package:flutternews/theme/mythemes.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  //init state to navigate to home
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image asset
            Image.asset(
              'assets/main/main.jpg',
              width: 340,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Flutter", style: MyTheme.myTheme.textTheme.displayLarge),
                GradientText("News",
                    style: const TextStyle(
                      letterSpacing: -.5,
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                    ),
                    colors: [
                      MyTheme.myTheme.colorScheme.primary,
                      MyTheme.myTheme.colorScheme.secondary,
                      MyTheme.myTheme.colorScheme.tertiary,
                    ])
              ],
            ),

            const SizedBox(height: 20),

            //description about app
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Introducing Flutter News 📰: Your go-to app for breaking news and in-depth analyses tailored to your interests! Stay informed effortlessly with personalized updates, bookmark articles, and engage with a vibrant community. 💡📱',
                textAlign: TextAlign.center,
                style: MyTheme.myTheme.textTheme.displaySmall,
              ),
            ),

            const SizedBox(height: 100),

            LoadingAnimationWidget.waveDots(
                color: MyTheme.myTheme.colorScheme.secondary, size: 40)
          ],
        ),
      ),
    );
  }
}
