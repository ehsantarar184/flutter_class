import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: MyApp()),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void playAudio(String fileName) {
    final players = AudioCache();
    players.play('assets_note$fileName.wav');
  }

  Expanded customWidget(Color color, String fileName) {
    return Expanded(
      child: Container(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
          ),
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
        customWidget(Colors.grey, "2"),
        customWidget(Colors.green, "3"),
        customWidget(Colors.blue, "4"),
        customWidget(Colors.cyan, "5"),
        customWidget(Colors.yellow, "6"),
        customWidget(Colors.pink, "7"),
      ],
    );
  }
}