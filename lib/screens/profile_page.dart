import 'package:e_czane/widgets/eczane_appbar.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:flutter/material.dart';

class EczaneProfilePage extends StatelessWidget {
  const EczaneProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EczaneScaffold(
        appBar: EczaneAppbar(), widget: Text("profile page"));
  }
}
