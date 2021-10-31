import 'package:flutter/material.dart';
import 'dart:async';

import 'package:quiz_app/home.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}
class _splashscreenState extends State<splashscreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homepage(),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("EHSAN ULLAH (FA18-BCS-027)")),
      body: Center(
        child: Text(
          "Quiz App Splash Screen",
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.black,
            fontFamily: "Satisfy",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}