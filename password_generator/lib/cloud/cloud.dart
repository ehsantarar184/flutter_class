import 'package:flutter/material.dart';

class cloud extends StatefulWidget {
  const cloud({Key key}) : super(key: key);

  @override
  _cloudState createState() => _cloudState();
}

class _cloudState extends State<cloud> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(onPressed: (){Navigator.push(context,

                  MaterialPageRoute(builder: (context) =>  scavecloud()),);},
                  child: Text("Click to save to cloud"),)
              ],
            )
        ),
      ),
    );
  }
}
class scavecloud extends StatefulWidget {
  const scavecloud({Key key}) : super(key: key);

  @override
  _scavecloudState createState() => _scavecloudState();
}

class _scavecloudState extends State<scavecloud> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Succesfully saved to cloud", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0),
                )
              ],
            )
        ),
      ),
    );
  }
}
