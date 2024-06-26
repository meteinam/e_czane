import 'package:e_czane/constants.dart';
import 'package:e_czane/services/api_service.dart';
import 'package:e_czane/style/button_style.dart';
import 'package:e_czane/style/color.dart';
import 'package:e_czane/widgets/eczane_buttons.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:e_czane/widgets/eczane_textfield.dart';
import 'package:flutter/material.dart';

class EczaneSignupPage extends StatefulWidget {
  const EczaneSignupPage({super.key});

  @override
  State<EczaneSignupPage> createState() => _EczaneSignupPageState();
}

class _EczaneSignupPageState extends State<EczaneSignupPage> {
  final TextEditingController tcNumController = TextEditingController();

  final TextEditingController phoneNumController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordAgainController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController surnameController = TextEditingController();
  DateTime? _selectedDate;
  String _formattedDate = "";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _formattedDate = _selectedDate.toString();
      });
    }
  }

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
        GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              width: 300,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.transparent,
                ),
                color: eczaneLightGrey,
              ),
              child: Center(
                child: Text(
                    _formattedDate == "" ? "Date of Birth" : _formattedDate),
              ),
            )),
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
                    "tcId": tcNumController.text,
                    "name": nameController.text,
                    "surname": surnameController.text,
                    "email": emailController.text,
                    "dateOfBirth": _formattedDate,
                    "phoneNumber": phoneNumController.text,
                    "password": passwordController.text,
                  }, () {
                    Navigator.popAndPushNamed(context, "/LoginPage");
                  }, "api/user/", context);
                },
                style: button3),
          ],
        )
      ],
    ));
  }
}
