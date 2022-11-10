import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType input;

  const TextInput(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      required this.input});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: input,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      controller: controller,
    );
  }
}
