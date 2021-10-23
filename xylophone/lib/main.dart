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
class xylophone extends StatefulWidget {
  const xylophone({Key? key}) : super(key: key);

  @override
  _xylophoneState createState() => _xylophoneState();
}

class _xylophoneState extends State<xylophone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Splash Screen Example")),
      body: Center(
          child:Text("Welcome to Home Page",
              style: TextStyle( color: Colors.black, fontSize: 30)
          )
      ),
    );
  }
}