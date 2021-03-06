import 'package:cards_control/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Control',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('pt', 'BR'),
      ],
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
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
      },
    );
  }
}
