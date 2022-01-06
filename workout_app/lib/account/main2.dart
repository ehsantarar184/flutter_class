import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/account/screens/auth/forgot_password_screen.dart';
import 'package:workout_app/account/screens/auth/login_screen.dart';
import 'package:workout_app/account/screens/auth/register_screen.dart';
import 'package:workout_app/account/screens/splash_screen.dart';
import 'package:workout_app/account/screens/user/home_screen.dart';
import 'package:workout_app/screens/welcom_view.dart';
void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, firebaseCoreSnapshot) {
        return MaterialApp(
          title: 'Flutter Gym App',
          theme: ThemeData(
            fontFamily: 'Ruda',
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: const Color(0xffF05D22), secondary: Colors.white),
            appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Color(0x00ffffff),
                foregroundColor: Colors.black),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xffF05D22)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          ),
          home: firebaseCoreSnapshot.connectionState == ConnectionState.waiting
              ? const SplashScreen()
              : StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, userStreamSnapshot) {
                // if (userStreamSnapshot.connectionState == ConnectionState.waiting) {
                //   return const SplashScreen();
                // }
                if (userStreamSnapshot.hasData && !userStreamSnapshot.hasError) {
                  return WelcomView();
                } else {
                  return const LoginScreen();
                }
              }),
          routes: {
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
            HomeScreen.routeName: (context) => WelcomView(),
          },
        );
      },
    );
  }
}
