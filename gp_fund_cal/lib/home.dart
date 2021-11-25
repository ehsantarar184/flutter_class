import 'package:flutter/material.dart';
import 'package:gp_fund_cal/next_page.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


void main() {
  return runApp(calender());
}

/// My app class to display the date range picker
class calender extends StatefulWidget {
  @override
  calenderState createState() => calenderState();
}

/// State for MyApp
class calenderState extends State<calender> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('GP Fund Calculator'),
            ),
            body: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Selected date: ' + _selectedDate),
                      Text('Selected date count: ' + _dateCount),
                      Text('Selected range: ' + _range),
                      Text('Selected ranges count: ' + _rangeCount)
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 80,
                  right: 0,
                  bottom: 0,
                  child: SfDateRangePicker(
                    selectionMode: DateRangePickerSelectionMode.range,
                    initialSelectedRange: PickerDateRange(
                        DateTime.now().subtract(const Duration(days: 4)),
                        DateTime.now().add(const Duration(days: 3))),
                  ),
                )
              ],

            ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('GP Fund Calculator'),
                  ),
                  ListTile(
                    title: const Text('Ehsan Ullah'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('FA18-BCS-027'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Contact Us'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.push(context,

                        MaterialPageRoute(builder: (context) =>  date()),);
                    },
                  ),
                ],
              )),
        ));

  }
}