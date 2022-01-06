import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String title;

  final void Function()? onPressed;
  const AuthButton({
    this.onPressed,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(fontSize: 25),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(deviceSize.width * 1, deviceSize.height * 0.06),
        ),
      ),
    );
  }
}
