import 'package:flutter/material.dart';

class ListBrowseText extends StatelessWidget {
  final String text;
  final double fontSize;
  const ListBrowseText({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
