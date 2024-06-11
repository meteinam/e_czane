import 'package:e_czane/constants.dart';
import 'package:e_czane/services/api_service.dart';
import 'package:e_czane/style/button_style.dart';
import 'package:e_czane/widgets/eczane_buttons.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:e_czane/widgets/eczane_textfield.dart';
import 'package:flutter/material.dart';

class EczaneSignupPage extends StatelessWidget {
  EczaneSignupPage({super.key});
  final TextEditingController tcNumController = TextEditingController();
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
        EczaneTextField(
            keyboardType: TextInputType.number,
            controller: tcNumController,
            width: 300,
            height: 35,
            hint: "T.C. Kimlik No"),
        eczaneSmallPadding,
        EczaneTextField(
          controller: nameController,
          hint: "name",
          width: 300,
          height: 35,
        ),
        eczaneSmallPadding,
        EczaneTextField(
          controller: surnameController,
          hint: "surname",
          width: 300,
          height: 35,
        ),
        eczaneSmallPadding,
        EczaneTextField(
          controller: phoneNumController,
          hint: "phone number",
          keyboardType: TextInputType.phone,
          width: 300,
          height: 35,
        ),
        eczaneSmallPadding,
        EczaneTextField(
          controller: emailController,
          hint: "e-mail",
          keyboardType: TextInputType.emailAddress,
          width: 300,
          height: 35,
        ),
        eczaneSmallPadding,
        EczaneTextField(
          controller: passwordController,
          hint: "password",
          isObscured: true,
          width: 300,
          height: 35,
        ),
        eczaneSmallPadding,
        EczaneTextField(
          controller: passwordAgainController,
          hint: "password again",
          isObscured: true,
          width: 300,
          height: 35,
        ),
        eczaneSmallPadding,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EczaneActionButton(
                title: "Sign Up",
                onPressed: () async {
                  await ApiService().postData({
                    "tcNum": tcNumController.text,
                    "name": nameController.text,
                    "surname": surnameController.text,
                    "phoneNum": phoneNumController.text,
                    "email": emailController.text,
                    "password": passwordController.text,
                  }, () {
                    Navigator.pushNamed(context, "/login");
                  }, "http://localhost:3000/signup");
                },
                style: button3),
          ],
        )
      ],
    ));
  }
}
