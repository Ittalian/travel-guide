import 'package:flutter/material.dart';

class BaseTextformfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final double? fontSize;
  final Color? color;
  final bool isCenter;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const BaseTextformfield(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.isCenter,
      this.fontSize,
      this.color,
      this.validator,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: isCenter ? TextAlign.center : TextAlign.left,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: fontSize == null
            ? const TextStyle()
            : TextStyle(fontSize: fontSize),
        border: InputBorder.none,
        filled: !(color == null),
        fillColor: color,
      ),
      validator: validator,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
