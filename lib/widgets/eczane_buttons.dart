import 'package:e_czane/style/button_style.dart';
import 'package:e_czane/style/text_sytle.dart';
import 'package:flutter/material.dart';

class GridViewButton extends StatelessWidget {
  final String title;
  const GridViewButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: button1,
      child: Text(
        title,
        style: textStyleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
