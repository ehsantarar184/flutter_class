import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Dice App",
    color: Colors.red,
    home: homePage(),
  ));
}
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int num1 = 1;
  int num2 = 1;
  int num3 = 1;
  int num4 = 1;
  int pls1 = 0;
  int pls2 = 0;
  int pls3 = 0;
  int pls4 = 0;
  int maxTime = 10;
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(

        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Player 1",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160),
                  child: Text(
                    "Player 2",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                )
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      num1 = Random().nextInt(6) + 1;
                      pls1 += num1;
                      print(pls1);

                    });
                  },
                  child: Image.asset(
                    "images/dice$num1.png",
                    height: 150,
                    width: 150,
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      for(int i=0; i<=10; i++)
                      num2 = Random().nextInt(6) + 1;
                      pls2 += num2;

                    });
                  },
                  child: Image.asset(

                    "images/dice$num2.png",
                    height: 150,
                    width: 150,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),


            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      num3 = Random().nextInt(6) + 1;
                      pls3 += num3;
                    });
                  },
                  child: Image.asset(
                    "images/dice$num3.png",
                    height: 150,
                    width: 150,
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      num4 = Random().nextInt(6) + 1;
                      pls4 += num4;
                    });
                  },
                  child: Image.asset(
                    "images/dice$num4.png",
                    height: 150,
                    width: 150,

                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Player 3",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160),
                  child: Text(
                    "Player 4",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),

                )
              ],
            ),



            Text("Player 1 score: $pls1"),
            Text("Player 2 score: $pls2"),
            Text("Player 3 score: $pls3"),
            Text("Player 4 score: $pls4"),
            // Text(
            // result,
            // style: TextStyle(
            // fontWeight: FontWeight.bold,
            // color: Colors.white,
            // fontSize: 20,
            // ),


// ),
          ],
        ),
      ),
    );
  }
}