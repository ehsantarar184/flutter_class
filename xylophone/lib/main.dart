import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  theme: ThemeData(primaryColor: Colors.red,accentColor: Colors.yellowAccent),
  debugShowCheckedModeBanner: false,
  home: xylo(),
)
);

class xylo extends StatefulWidget{
  @override
  SplashScreenState createState()=> SplashScreenState();
}

class SplashScreenState extends State<xylo>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),()=>Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
        (context) => xylophone()
    )
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.orangeAccent),
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
                        radius: 100.0,
                        child: Icon(
                          Icons.android,
                          color: Colors.orangeAccent,
                          size: 100.0,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 40.0),
                      ),
                      Text(
                        "Flutter",
                        style: TextStyle(color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text("Splash Screen",
                        style: TextStyle(color: Colors.white,
                          fontSize: 30.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(

                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.tealAccent),
                        strokeWidth: 5.0,
                        //backgroundColor: Colors.redAccent,
                      ),
                      height: 70.0,
                      width: 70.0,
                    ),
                    Padding(padding: EdgeInsets.only(top: 40.0),

                    ),
                    Text("Welcome\nEveryone",
                      style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),

                    )
                  ],
                ),)
            ],
          )
        ],
      ),
    );
  }

}
class xylophone extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({Color color, int soundNumber}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, soundNumber: 1),
              buildKey(color: Colors.orange, soundNumber: 2),
              buildKey(color: Colors.yellow, soundNumber: 3),
              buildKey(color: Colors.green, soundNumber: 4),
              buildKey(color: Colors.teal, soundNumber: 5),
              buildKey(color: Colors.blue, soundNumber: 6),
              buildKey(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}