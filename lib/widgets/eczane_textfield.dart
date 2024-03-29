import 'package:e_czane/style/color.dart';
import 'package:flutter/material.dart';

class EczaneTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscured;
  final String? obscuringCharacter;
  final Color? bgColor;
  final double width;
  final double height;
  const EczaneTextField({
    super.key,
    this.hint,
    required this.controller,
    this.keyboardType,
    this.isObscured,
    this.obscuringCharacter,
    this.bgColor,
    required this.width,
    required this.height,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: bgColor ?? eczaneLightGrey,
      ),
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
            gapPadding: 5,
            borderRadius: BorderRadius.circular(12.0),
          ),
          fillColor: eczaneLightGrey,
        ),
      ),
    );
  }
}
