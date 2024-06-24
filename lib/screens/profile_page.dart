import 'package:e_czane/services/api_service.dart';
import 'package:e_czane/style/color.dart';
import 'package:e_czane/style/text_sytle.dart';
import 'package:e_czane/widgets/eczane_appbar.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:flutter/material.dart';

class EczaneProfilePage extends StatefulWidget {
  const EczaneProfilePage({super.key});

  @override
  State<EczaneProfilePage> createState() => _EczaneProfilePageState();
}

class _EczaneProfilePageState extends State<EczaneProfilePage> {
  final String image = "images/stockpp.png";

  @override
  void initState() {
    super.initState();
    ApiService().getData("", context);
  }

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
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: eczaneLightGrey,
              ),
              child: Text(
                "Kullanıcı Adı",
                style: blackTextStyleSmall,
              ),
            ),
            const SizedBox(height: 20),
            const Text(""),
          ],
        ));
  }
}
