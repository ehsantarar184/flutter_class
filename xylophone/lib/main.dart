import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MaterialApp(
  theme:
  ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
  debugShowCheckedModeBanner: false,
  home: xylo(),
));

class xylo extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<xylo> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => xylophone())));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 70.0,
                        child: Icon(
                          Icons.android_sharp,
                          color: Colors.orangeAccent,
                          size: 70.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.0),
                      ),
                      Text(
                        "Flutter Xylophone App",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Xylophone Splash Screen",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.tealAccent),
                        strokeWidth: 5.0,
                        //backgroundColor: Colors.redAccent,
                      ),
                      height: 50.0,
                      width: 50.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.0),
                    ),
                    Image.asset("assets/xy.jpg",width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,),

                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class xylophone extends StatelessWidget {
  const xylophone({Key? key}) : super(key: key);

  void playAudio(String fileName) {
    final players = AudioCache();
    players.play('note$fileName.wav');
  }

  Expanded customWidget(Color color, String fileName) {
    return Expanded(
      child: Container(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color),
            onPressed: () {
            playAudio(fileName);
          },
          child: Text(''),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        customWidget(Colors.red, "1"),
        customWidget(Colors.pink, "2"),
        customWidget(Colors.green, "3"),
        customWidget(Colors.blue, "4"),
        customWidget(Colors.cyan, "5"),
        customWidget(Colors.yellow, "6"),
        customWidget(Colors.tealAccent, "7"),
      ],
    );
  }
}