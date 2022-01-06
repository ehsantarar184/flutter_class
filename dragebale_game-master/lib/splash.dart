import 'dart:async';

import 'package:dragebalegame/home.dart';
import 'package:flutter/material.dart';
class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Homepage1(),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Umar (FA18-BCS-112)")),
      body: Center(
        child: Text(
          "Matching App\nSplash Screen",
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.cyanAccent,
            fontFamily: "Satisfy",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}