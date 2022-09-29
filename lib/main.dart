import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/screens/splash_screen.dart';

import 'consts/globals.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App ',
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.lightScaffoldColor,
        primaryColor: Constants.lightCardColor,
        backgroundColor: Constants.lightBackgroundColor,
        appBarTheme: const AppBarTheme(
          iconTheme:  IconThemeData(
            color: Constants.lightIconsColor,
          ),
          backgroundColor: Constants.lightScaffoldColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: Constants.lightTextColor, fontSize: 22, fontWeight: FontWeight.bold),
          elevation: 0,
        ),
        iconTheme:const IconThemeData(
          color: Constants.lightIconsColor,
        ),

        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.blue,

          // selectionHandleColor: Colors.blue,
        ),

        // textTheme: TextTheme()
        // textTheme: Theme.of(context).textTheme.apply(
        //       bodyColor: Colors.black,
        //       displayColor: Colors.black,
        //     ),
        cardColor: Constants.lightCardColor,
        brightness: Brightness.light,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Constants.lightIconsColor,
              brightness: Brightness.light,
            ),
      ),
      home: const SplashScreen(),
    );
  }
}
