import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Sample",
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("My APP"),
            ),
            body: Center(
              child: Text("Ehsan Ullah",
                style: TextStyle(
                  color: Colors.tealAccent,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 40.0,
                  wordSpacing: 20.0,
                  background: Paint()..color=Colors.black..style=PaintingStyle.stroke,
                ),

              ),
            )
        )
    );
  }
}
