import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogCreator {
  String content;
  Function function;
  BuildContext context;

  DialogCreator(String _content, Function _function, BuildContext _context) {
    content = _content;
    function = _function;
    context = _context;
  }

  show() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Warning!", style: TextStyle(color: Colors.red)),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel", style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Yes",
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.black)),
                onPressed: () {
                  function();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
