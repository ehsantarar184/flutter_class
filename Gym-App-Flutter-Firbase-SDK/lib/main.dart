import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/screens/auth/forgot_password_screen.dart';
import 'package:gym_app/screens/auth/login_screen.dart';
import 'package:gym_app/screens/auth/register_screen.dart';
import 'package:gym_app/screens/splash_screen.dart';
import 'package:gym_app/screens/user/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, firebaseCoreSnapshot) {
        return MaterialApp(
          title: 'Flutter Demo',
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
                    if (userStreamSnapshot.connectionState == ConnectionState.waiting) {
                      return const SplashScreen();
                    }
                    if (userStreamSnapshot.hasData && !userStreamSnapshot.hasError) {
                      return HomeScreen();
                    } else {
                      return const LoginScreen();
                    }
                  }),
          routes: {
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
          },
        );
      },
    );
  }
}
