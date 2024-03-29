import 'package:e_czane/widgets/eczane_appbar.dart';
import 'package:e_czane/widgets/eczane_listview.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:flutter/material.dart';

class EczaneMainPage extends StatelessWidget {
  const EczaneMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EczaneScaffold(
      appBar: EczaneAppbar(
        backButtonPressed: () {
          Navigator.popAndPushNamed(context, '/MyHomePage');
        },
      ),
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: const EczaneListView()),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
