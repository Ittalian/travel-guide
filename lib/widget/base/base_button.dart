import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  const BaseButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 20),
        ));
  }
}
