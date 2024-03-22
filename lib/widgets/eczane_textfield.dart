import 'package:e_czane/style/color.dart';
import 'package:flutter/material.dart';

class EczaneTextField extends StatelessWidget {
  final String? hint;
  EczaneTextField({super.key, this.hint});
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 35,
      child: TextField(
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
