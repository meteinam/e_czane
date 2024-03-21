import 'package:e_czane/widgets/eczane_appbar.dart';
import 'package:e_czane/widgets/eczane_listview.dart';
import 'package:flutter/material.dart';

class EczaneScaffold extends StatefulWidget {
  const EczaneScaffold({super.key});

  @override
  State<EczaneScaffold> createState() => _EczaneScaffoldState();
}

class _EczaneScaffoldState extends State<EczaneScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EczaneAppbar(),
      body: const Center(
        child: EczaneListView(),
      ),
    );
  }
}