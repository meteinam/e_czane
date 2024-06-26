import 'package:e_czane/constants.dart';
import 'package:e_czane/style/button_style.dart';
import 'package:e_czane/widgets/eczane_buttons.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return EczaneScaffold(
        widget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EczaneActionButton(
          title: "Giriş Yap",
          onPressed: () {
            Navigator.popAndPushNamed(context, "/LoginPage");
          },
          style: button2,
        ),
        eczaneSmallPadding,
        EczaneActionButton(
          title: "Kayıt ol",
          onPressed: () {
            Navigator.popAndPushNamed(context, "/SignUpPage");
          },
          style: button2,
        ),
      ],
    ));
  }
}
