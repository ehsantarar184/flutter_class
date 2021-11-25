import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gp_fund_calculator/home.dart';

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
        builder: (context) => calender(),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("EHSAN ULLAH (FA18-BCS-027)")),
      body: Center(
        child: Text(
          "GP Fund Calculator \n Splash Screen",
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}