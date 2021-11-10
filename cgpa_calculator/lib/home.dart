import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ehsan",
                style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  fontSize: 50.0,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
