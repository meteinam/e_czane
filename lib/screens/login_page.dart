import 'package:e_czane/constants.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:e_czane/widgets/eczane_textfield.dart';
import 'package:flutter/material.dart';

class EczaneLoginPage extends StatelessWidget {
  const EczaneLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EczaneScaffold(
        widget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EczaneTextField(hint: "e-mail"),
        eczaneSmallPadding,
        EczaneTextField(hint: "password")
      ],
    ));
  }
}
