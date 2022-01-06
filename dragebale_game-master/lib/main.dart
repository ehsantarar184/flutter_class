import 'package:dragebalegame/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matching App For Kids',
      color: Colors.redAccent,
      theme: ThemeData(
        accentColor: Colors.cyan,
      ),
      home: splashscreen(),
    );
  }
}

