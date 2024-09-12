import 'package:flutter/material.dart';

class ScheduleDateText extends StatelessWidget {
  final Color containerColor;
  final String text;
  const ScheduleDateText({super.key, required this.containerColor, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20, color: Colors.black, decorationColor: containerColor),
      overflow: TextOverflow.ellipsis,
    );
  }
}
