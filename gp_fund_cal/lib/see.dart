import 'package:flutter/material.dart';
import 'package:gp_fund_cal/next.dart';
class og1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String date = "";

  DateTime initialselectedDate = DateTime.now();

  DateTime finalselectedDate = DateTime.now();
  int difference=0;
  void differenceInDays(){
    setState(() {
      difference=initialselectedDate.difference(finalselectedDate).inDays;

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Datepicker"),
      ),
      body: Column(
        children: [

          SizedBox(height: 70,),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ElevatedButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: const Text("Initial Date"),
                ),
              ),
              const SizedBox(width: 50,),
              Text(
                  "${initialselectedDate.day}/${initialselectedDate.month}/${initialselectedDate.year}"),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ElevatedButton(
                  onPressed: () {
                    _selectDate2(context);
                  },
                  child: const Text("Final Date"),
                ),
              ),

              const SizedBox(width: 50,),
              Text(
                  "${finalselectedDate.day}/${finalselectedDate.month}/${finalselectedDate.year}"),

            ],
          ),



          MaterialButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => next()),
            );
          },
            splashColor: Colors.white,
          child: Text("Done",
          style: TextStyle(
            fontSize: 20.0,


          ),
          ),

          )
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: initialselectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != initialselectedDate) {
      setState(() {
        initialselectedDate = selected;
      });
    }
  }

  _selectDate2(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: finalselectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != finalselectedDate) {
      setState(() {
        finalselectedDate = selected;
      });
    }
  }
}