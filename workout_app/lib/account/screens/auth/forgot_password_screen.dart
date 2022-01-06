
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/account/widgets/auth/auth_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forgot-password';

  final emailController = TextEditingController();

  void _errorSnackBar(BuildContext context, [String? errorMessage]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage ?? 'Something went wrong! Please Try Again'),
      ),
    );
  }

  void _sendResetPasswordEmail(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (emailController.text.isEmpty ||
        !emailController.text.contains('@') ||
        !emailController.text.contains('.')) {
      _errorSnackBar(context, 'Please Enter A Valid Email');
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Check your Email ')),
      );
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (error) {
      _errorSnackBar(context, error.message);
    } catch (error) {
      _errorSnackBar(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  labelText: 'Enter your Email',
                  contentPadding: EdgeInsets.only(left: 15),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              AuthButton(onPressed: () => _sendResetPasswordEmail(context), title: 'Reset Password')
            ],
          ),
        )),
      ),
    );
  }
}
