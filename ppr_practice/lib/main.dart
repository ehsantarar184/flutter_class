import 'package:flutter/material.dart';
import 'package:ppr_practice/dd.dart';

void main() {
  runApp(const abc());
}
class abc extends StatelessWidget {
  const abc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParentWidget(),
    );
  }
}
