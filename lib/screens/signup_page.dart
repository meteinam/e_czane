import 'package:e_czane/constants.dart';
import 'package:e_czane/style/button_style.dart';
import 'package:e_czane/widgets/eczane_buttons.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:e_czane/widgets/eczane_textfield.dart';
import 'package:flutter/material.dart';

class EczaneSignupPage extends StatelessWidget {
  EczaneSignupPage({super.key});
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return EczaneScaffold(
        widget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EczaneTextField(controller: nameController, hint: "name"),
        eczaneSmallPadding,
        EczaneTextField(controller: surnameController, hint: "surname"),
        eczaneSmallPadding,
        EczaneTextField(
            controller: phoneNumController,
            hint: "phone number",
            keyboardType: TextInputType.phone),
        eczaneSmallPadding,
        EczaneTextField(
            controller: emailController,
            hint: "e-mail",
            keyboardType: TextInputType.emailAddress),
        eczaneSmallPadding,
        EczaneTextField(
            controller: passwordController, hint: "password", isObscured: true),
        eczaneSmallPadding,
        EczaneTextField(
            controller: passwordAgainController,
            hint: "password again",
            isObscured: true),
        eczaneSmallPadding,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EczaneActionButton(
                title: "Sign Up", onPressed: () {}, style: button3),
          ],
        )
      ],
    ));
  }
}
