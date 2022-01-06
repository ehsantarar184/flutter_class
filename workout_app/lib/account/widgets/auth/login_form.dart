
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/account/screens/auth/forgot_password_screen.dart';
import 'package:workout_app/account/screens/auth/register_screen.dart';

import 'auth_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  Map<String, String> loginData = {
    'email': '',
    'password': '',
  };

  void _displayErrorToUser([String? errorMessage]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).errorColor,
      content: Text(
        errorMessage ?? 'something went wrong! please try again',
      ),
    ));
  }

  void _logTheUserIn() async {
    FocusScope.of(context).unfocus();
    final isFormDataValid = formKey.currentState!.validate();
    if (!isFormDataValid) return;
    formKey.currentState!.save();

    final _auth = FirebaseAuth.instance;
    try {
      await _auth.signInWithEmailAndPassword(
          email: loginData['email']!, password: loginData['password']!);
    } on FirebaseAuthException catch (error) {
      _displayErrorToUser(error.message);
    } catch (error) {
      _displayErrorToUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    //final deviceSize = MediaQuery.of(context).size
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.face),
                    labelText: 'E-Mail',
                    contentPadding: EdgeInsets.only(left: 15),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Email';
                    }
                    if (!value.contains('@') && !value.contains('.')) {
                      return 'Please Enter a valid Email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    loginData['email'] = value!.trim();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.lock),
                    labelText: 'password',
                    contentPadding: EdgeInsets.only(left: 15),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Password';
                    }
                    if (value.length < 6) {
                      return 'password is too short. Please Enter a valid one';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    loginData['password'] = value!;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: Color(0xff00A2D2)),
                      ),
                      style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
                    )
                  ],
                ),
                AuthButton(
                  onPressed: () => _logTheUserIn(),
                  title: 'Login',
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(RegisterScreen.routeName);
                      },
                      child: const Text(
                        'Register!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
