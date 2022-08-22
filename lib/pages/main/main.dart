import 'package:crypto_flutter_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textSize = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: textSize.copyWith(
          headline4: textSize.headline4!.copyWith(color: Colors.yellow),
          headline5: textSize.headline5!.copyWith(color: Colors.yellow),
          headline6: textSize.headline6!.copyWith(color: Colors.yellow),
          subtitle1: textSize.subtitle1!.copyWith(color: Colors.yellow),
          subtitle2: textSize.subtitle2!.copyWith(color: Colors.yellow),
          bodyText1: textSize.bodyText1!.copyWith(color: Colors.yellow),
          overline: textSize.overline!.copyWith(color: Colors.grey),
        ),
        scaffoldBackgroundColor: Colors.blue,
      ),
      themeMode: ThemeMode.light,
      home: Scaffold(
          body: HomePage()),
    );
  }
}
