import 'package:e_czane/style/color.dart';
import 'package:e_czane/style/text_sytle.dart';
import 'package:e_czane/widgets/eczane_appbar.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:flutter/material.dart';

class EczaneProfilePage extends StatelessWidget {
  const EczaneProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return EczaneScaffold(
        appBar: EczaneAppbar(
          backButtonPressed: () {
            Navigator.popAndPushNamed(context, '/MyHomePage');
          },
        ),
        widget: Column(
          children: [
            const SizedBox(height: 100),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: eczaneLightGrey,
              ),
              child: Text(
                'John Doe',
                style: blackTextStyleSmall,
              ),
            ),
            const SizedBox(height: 20),
            const Text(""),
          ],
        ));
  }
}
