import 'package:GainZ/helpers/screen.dart';
import 'package:GainZ/screens/dashboardScreen.dart';
import 'package:flutter/material.dart';

// Pages
import 'screens/exercisesScreen.dart';
import 'screens/weightScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int screenIndex = 0;

  final screens = [
    Screen(DashboardScreen(), "Dashboard", "Dashboard", Icon(Icons.ac_unit)),
    Screen(ExercisesScreen(), "Exercises", "Exercises", Icon(Icons.ac_unit)),
    Screen(WeightScreen(), "Weight Log", "Weight Log", Icon(Icons.ac_unit)),
  ];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[screenIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        showUnselectedLabels: false,
        currentIndex: screenIndex,
        items: screens
            .map((screen) => BottomNavigationBarItem(
                  title: Text(screen.navBarText),
                  icon: screen.icon,
                ))
            .toList(),
        onTap: (int index) {
          setState(() => screenIndex = index);
        },
      ),
    );
  }
}
