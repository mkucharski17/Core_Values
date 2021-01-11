import 'package:core_values/global_providers.dart';
import 'package:core_values/ui/home_scrren/home_screen.dart';
import 'package:flutter/material.dart';

const values = <String>[
  "Exceed clients' and colleagues' expectations",
  "Take ownership and question the status quo in a constructive manner",
  "Be brave, curious and experiment. Learn from all successes and failures",
  "Act in a way that makes all of us proud",
  "Build an inclusive, transparent and socially responsible culture",
  "Be ambitious, grow yourself and the people around you",
  "Recognize excellence and engagement"
];

void main() {
  runApp(GlobalProviders());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Core Values',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.black,
          primaryColor: Colors.white,
          buttonTheme: ButtonThemeData(buttonColor: Colors.black),
          iconTheme: IconThemeData(size: 30),
          fontFamily: 'LexendDeca',
        ),
        darkTheme: ThemeData(
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
          brightness: Brightness.dark,
          accentColor: Colors.white,
          shadowColor: Colors.white,
          textSelectionHandleColor: Colors.white,
        ),
        home: HomeScreen());
  }
}
