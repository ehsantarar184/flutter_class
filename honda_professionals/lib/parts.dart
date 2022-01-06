import 'package:flutter/material.dart';

class part_purchase extends StatefulWidget {
  const part_purchase({Key? key}) : super(key: key);

  @override
  _part_purchaseState createState() => _part_purchaseState();
}

class _part_purchaseState extends State<part_purchase> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        body: const Center(
          
        ),
        ),
    );
  }
}
