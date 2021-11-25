import 'package:flutter/material.dart';

class next extends StatelessWidget {
  const next({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Actual Value"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                    children: [
                      Text("Your actual value is 30000 for year one for year 2 select og-2",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.cyan,
                        ),
                      ),
                    ]
                ),
                Row(
                    children: [
                      Text("For Interset rate click below button",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.cyan,
                        ),
                      ),
                    ]
                ),
                MaterialButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => interset()),
                  );
                },
                  splashColor: Colors.cyan,
                  child: Text("Interset",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.amber,

                    ),
                  ),

                )
              ],
            ),
          ],
        )
      ),
    );
  }
}
class interset extends StatelessWidget {
  const interset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCustomForm(),
    );
  }
}
class MyCustomForm extends StatelessWidget {
  const MyCustomForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your slaray',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your username',
            ),
          ),
        ),
      ],
    );
  }
}