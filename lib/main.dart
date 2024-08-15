import 'package:flutter/material.dart';
// import 'package:flutternews/category/ui/category_article_view.dart';
import 'package:flutternews/splash/ui/splash_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
