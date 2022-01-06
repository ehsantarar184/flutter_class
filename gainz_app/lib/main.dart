import 'package:flutter/material.dart';

// Routes
import 'home.dart';
import 'pages/exerciseDetails.dart';
import 'pages/workoutDetails.dart';

void main() => runApp(MyApp());

// Main starting component
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GainZ - Track your progress in the gym!",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.black,
        fontFamily: 'Montserrat',
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        final args = settings.arguments;
        final routeName = settings.name;

        return MaterialPageRoute(
            builder: (BuildContext context) => makeRoute(
                context: context, routeName: routeName, arguments: args));
      },
    );
  }

  Widget makeRoute({
    @required BuildContext context,
    @required String routeName,
    Object arguments,
  }) {
    final Widget child = _buildRoute(
      context: context,
      routeName: routeName,
      arguments: arguments,
    );
    return child;
  }

  Widget _buildRoute({
    @required BuildContext context,
    @required String routeName,
    Object arguments,
  }) {
    switch (routeName) {
      case "/":
        return Home();
      case '/exerciseDetails':
        int exerciseID = arguments as int;
        return ExerciseDetailsScreen(id: exerciseID);
      case "/workoutDetails":
        int workoutID = arguments as int;
        return WorkoutDetailsScreen(id: workoutID);
      default:
        throw 'Route $routeName is not defined';
    }
  }
}
