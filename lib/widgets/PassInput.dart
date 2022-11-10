import 'package:flutter/material.dart';

class PassInput extends StatelessWidget {
  final bool obscure;
  final VoidCallback event;
  final String label;
  final String hint;
  final TextEditingController controller;

  const PassInput(
      {super.key,
      required this.obscure,
      required this.event,
      required this.label,
      required this.hint,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: event,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(obscure ? Icons.visibility : Icons.visibility_off),
          ),
        ),
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
