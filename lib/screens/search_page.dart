import 'package:e_czane/style/color.dart';
import 'package:e_czane/widgets/eczane_appbar.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:e_czane/widgets/eczane_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EczaneSearchPage extends StatelessWidget {
  EczaneSearchPage({super.key});
  final TextEditingController searchController = TextEditingController();

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
            SizedBox(height: 100),
            Stack(alignment: Alignment.center, children: [
              Container(
                width: 340,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: eczaneLightGrey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EczaneTextField(
                    controller: searchController,
                    hint: "Search",
                    width: 250,
                    height: 35,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search_rounded),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                      ))
                ],
              ),
            ])
          ],
        ));
  }
}
