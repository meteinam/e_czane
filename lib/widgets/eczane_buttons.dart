import 'package:e_czane/style/color.dart';
import 'package:flutter/material.dart';

class GridViewButton extends StatelessWidget {
  final String title;
  const GridViewButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(title),
      style: button1,
    );
  }
}

final ButtonStyle button1 = ElevatedButton.styleFrom(
    maximumSize: const Size(120, 120),
    backgroundColor: eczaneRed,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))));
