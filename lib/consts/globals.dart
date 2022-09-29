import 'package:flutter/material.dart';

class Constants{

  // Colors light theme
  static const Color lightScaffoldColor =  Color(0xFFF8F8F8);
 static const  Color lightCardColor = Color(0xFFFfFFFf);
  static const Color lightBackgroundColor =  Color(0xFFD0E8F2);
  static const Color lightIconsColor =  Color.fromARGB(255, 175, 0, 120);
  static const Color lightTextColor =  Color(0xff324558);

  // TextStyles

  static  TextStyle kSplashScreenTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    foreground: Paint()
      ..shader = const LinearGradient(
              colors: <Color>[Colors.green, Colors.white, Colors.green])
          .createShader(
        const Rect.fromLTWH(100.0, 50.0, 200.0, 100.0),
      ),
  );


}




 
