import 'package:flutter/material.dart';

class BaseTextformfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Color? color;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const BaseTextformfield(
      {super.key,
      required this.controller,
      required this.labelText,
      this.color,
      this.validator,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
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
