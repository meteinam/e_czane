import 'package:e_czane/constants.dart';
import 'package:e_czane/services/api_service.dart';
import 'package:e_czane/services/cache_service.dart';
import 'package:e_czane/style/button_style.dart';
import 'package:e_czane/widgets/eczane_buttons.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:e_czane/widgets/eczane_textfield.dart';
import 'package:flutter/material.dart';

class EczaneLoginPage extends StatelessWidget {
  EczaneLoginPage({super.key});

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return EczaneScaffold(
        widget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EczaneTextField(
          hint: "e-mail",
          controller: userNameController,
          keyboardType: TextInputType.emailAddress,
          width: 300,
          height: 35,
        ),
        eczaneSmallPadding,
        EczaneTextField(
          hint: "şifre",
          controller: passwordController,
          isObscured: true,
          width: 300,
          height: 35,
        ),
        eczaneSmallPadding,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EczaneActionButton(
                title: "Giriş Yap",
                onPressed: () async {
                  await ApiService().postData({
                    "email": userNameController.text,
                    "password": passwordController.text,
                  }, (data) {
                    deleteHive('accessToken');
                    deleteHive('refreshToken');
                    Navigator.popAndPushNamed(context, "/MyHomePage");
                    writeHive(data['accesToken'], data['refreshToken']);
                  }, "api/Auth/CreateToken/", context);
                },
                style: button3),
            eczaneSmallPadding,
            EczaneActionButton(
                title: "Kayıt ol",
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/SignUpPage");
                },
                style: button3),
          ],
        )
      ],
    ));
  }
}
