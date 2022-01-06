import 'package:flutter/material.dart';
import 'package:gym_app/widgets/auth/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Gym App Logo.png',
              width: 150,
              height: 250,
            ),
          ),
          const LoginForm(),
        ],
      ),
    );
  }
}
