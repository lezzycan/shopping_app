import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';
import 'package:grocery_app/screens/home_screen.dart';

import '../consts/globals.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Expanded(child: Lottie.asset('assets/lotie.json')),
          const SizedBox(
            height: 15,
          ),
          Text(
            'WELCOME TO LEZZYCAN \n GROCERY STORY',
            style: Constants.kSplashScreenTextStyle,
          ),
        ],
      ),
      nextScreen: const HomeScreen(),
      duration: 3000,
      splashIconSize: 350,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.topToBottom,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
