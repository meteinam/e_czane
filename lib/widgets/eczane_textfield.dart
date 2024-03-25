import 'package:e_czane/style/color.dart';
import 'package:flutter/material.dart';

class EczaneTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscured;
  final String? obscuringCharacter;
  const EczaneTextField(
      {super.key,
      this.hint,
      required this.controller,
      this.keyboardType,
      this.isObscured,
      this.obscuringCharacter});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 35,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isObscured ?? false,
        obscuringCharacter: obscuringCharacter ?? "*",
        style: const TextStyle(fontFamily: 'inter', fontSize: 25),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontFamily: 'inter', fontSize: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            fillColor: eczaneLightGrey),
      ),
    );
  }
}
