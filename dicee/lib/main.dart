import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[900],
        appBar: AppBar(
          title: Text("Dice App"),
        ),
        body: Dicepage(),
      ),
    ),
  );
}

class Dicepage extends StatefulWidget {
  const Dicepage({Key? key}) : super(key: key);

  @override
  _DicepageState createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  int number1 = 1;
  int number2 = 1;
  int number3 = 1;
  int number4 = 1;
  int resplayer1=0;
  int resplayer2=0;
  int resplayer3=0;
  int resplayer4=0;
  int player1term = 0;
  int player2term = 0;
  int player3term = 0;
  int player4term = 0;
  int counter=10;



  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (player1term <= 10)
                    number1 = Random().nextInt(6) + 1;
                    player1term = player1term + 1;
                    print("player1term$player1term");
                    print(number1);
                    resplayer1=resplayer1+number1;
                    counter = counter + 1;


                  }

                  );

                },
                child: Image(
                  image: AssetImage("images/dice$number1.png"),
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {


                  setState(() {

                    if (player2term <= 10) {
                      number2 = Random().nextInt(6) + 1;
                      player2term = player2term + 1;
                      print("player2term$player2term");
                      print(number2);
                      resplayer2=resplayer2+number2;
                      counter = counter + 1;

                    }});
                  },

                child: Image(
                  image: AssetImage("images/dice$number2.png"),
                  height: 150,
                  width: 150,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text("Player 1 score: $resplayer1"),
        Text("Player 2 score: $resplayer2"),
        Text("Player 3 score: $resplayer3"),
        Text("Player 4 score: $resplayer4"),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {


                  setState(() {
    if (player3term <= 10) {
    number3 = Random().nextInt(6) + 1;
    player3term = player3term + 1;
    print("player3term$player3term");
    print(number3);
    resplayer3=resplayer3+number3;
    counter = counter + 1;

    }
    }
                    );
                  },

                child: Image(
                  image: AssetImage("images/dice$number3.png"),
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {


                  setState(() {
                    if (player4term <= 10) {
                      number4 = Random().nextInt(6) + 1;
                      player4term = player4term + 1;
                      print("player4term$player4term");
                      print(number4);
                      resplayer4=resplayer4+number4;
                      counter = counter + 1;

                    }});
                  },

                child: Image(
                  image: AssetImage("images/dice$number4.png"),
                  height: 150,
                  width: 150,
                ),
              ),
            )
          ],
        ),






      ],
    );
  }
}

