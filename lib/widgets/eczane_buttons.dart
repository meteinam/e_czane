import 'package:e_czane/constants.dart';
import 'package:e_czane/style/button_style.dart';
import 'package:e_czane/style/text_sytle.dart';
import 'package:flutter/material.dart';

class GridViewButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final double? width;
  final double? height;
  const GridViewButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        height: height ?? DeviceSize.height / 4,
        width: width ?? DeviceSize.width / 2.1,
        child: ElevatedButton(
          onPressed: onPressed,
          style: button1,
          child: Text(
            title,
            style: textStyleSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class EczaneActionButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final ButtonStyle? style;
  const EczaneActionButton(
      {super.key, required this.title, required this.onPressed, this.style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style ?? button1,
      child: Text(
        title,
        style: textStyleMid,
        textAlign: TextAlign.center,
      ),
    );
  }
}
