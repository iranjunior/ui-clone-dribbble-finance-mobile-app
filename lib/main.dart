import 'package:cards_control/page/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lexend',
        canvasColor: Colors.transparent,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0.0,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
          subtitle1: TextStyle(
            color: Colors.white70,
            fontSize: 14.0,
          ),
          bodyText1: TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w400),
          caption: TextStyle(
            color: Colors.white70,
            fontSize: 8.0,
            fontWeight: FontWeight.w400,
          ),
          overline: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.0,
          ),
          subtitle2: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
          headline5: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
