import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData myTheme = ThemeData(

      //color schemes
      colorScheme: const ColorScheme.light(
          primary: Color(0XFFFF2E00),
          secondary: Color(0XFFC714D7),
          tertiary: Color(0XFF3F0E70)),

      //text themes
      textTheme: const TextTheme(
          //display large
          displayLarge: TextStyle(
              letterSpacing: -.5,
              color: Colors.black,
              fontSize: 38,
              fontWeight: FontWeight.w600),

          //label large
          labelLarge: TextStyle(
              letterSpacing: -.5,
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700),

          //label medium
          labelMedium: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700),

          //label small
          labelSmall: TextStyle(
              letterSpacing: -.1,
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500),

          //display small
          displaySmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 1.25,
              letterSpacing: .2),

          //display medium
          displayMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1,
            overflow: TextOverflow.ellipsis,
          )));
}
