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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Eczane'),
      ),
      body: const Center(
        child: Text('Eczane'),
      ),
    );
  }
}