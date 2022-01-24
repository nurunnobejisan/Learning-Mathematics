import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jisan/Age/constant/color.dart';
import 'package:jisan/screens/landing_screen.dart';
import 'package:jisan/utils/constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: COLOR_GREEN));
    return LayoutBuilder(builder: (context, constraints) {
      return MaterialApp(
        supportedLocales: [
          const Locale('en', 'US'), // English
        ],
        debugShowCheckedModeBanner: false,
        title: 'Screen 2',
        theme: ThemeData(textTheme: defaultText),
        home: LandingScreen(),
      );
    });
  }
}