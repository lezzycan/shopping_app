import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  // Colors light theme
  static const Color lightScaffoldColor = Color(0xFFF8F8F8);
  static const Color lightCardColor = Color(0xFFFfFFFf);
  static const Color lightBackgroundColor = Color(0xFFD0E8F2);
  static const Color lightIconsColor = Color.fromARGB(255, 175, 0, 120);
  static const Color lightTextColor = Color(0xff324558);
  static const Color lightOrangeColor = Color(0xFFEF9A9A);

  // TextStyles

  static TextStyle kSplashScreenTextStyle = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w900,
    foreground: Paint()
      ..shader = const LinearGradient(
              colors: <Color>[lightTextColor, Colors.red, Colors.green])
          .createShader(
        const Rect.fromLTWH(100.0, 50.0, 200.0, 100.0),
      ),
  );
  static TextStyle kTitleStyle = TextStyle(
    fontSize:  30.sp,
    color: Colors.black,
    fontWeight: FontWeight.w800,
  );

  // APIs

static  String allProductsAPI = 'https://api.escuelajs.co/api/v1/products';
}
