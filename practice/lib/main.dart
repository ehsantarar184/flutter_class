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
              title: Text("My APP",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40.0,
                color: Colors.lightGreen,

              ),
            ),
              ),

            body: Center(
              child: FlatButton(
                padding: EdgeInsets.all(10.0),
                highlightColor: Colors.greenAccent,
                splashColor: Colors.cyan,
                onPressed: (){},
                child: Text(
                  "Button",
                      style: TextStyle(
                    fontSize: 30.0
                ),
              ),
              ),
              // child: Text("Ehsan Ullah",
              //   style: TextStyle(
              //     color: Colors.tealAccent,
              //     fontWeight: FontWeight.bold,
              //     fontStyle: FontStyle.italic,
              //     fontSize: 40.0,
              //     wordSpacing: 20.0,
              //     decoration: TextDecoration.underline,
              //     decorationColor: Colors.amber,
              //     decorationStyle: TextDecorationStyle.dashed,
              //     letterSpacing: 20.0,
              //     fontFamily: "Times New Roman"
              //     // background: Paint()..color=Colors.black..style=PaintingStyle.stroke,
              //   ),
              //
              // ),
            )
        )
    );
  }
}
