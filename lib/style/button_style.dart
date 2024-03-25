import 'package:e_czane/style/color.dart';
import 'package:flutter/material.dart';

final ButtonStyle button1 = ElevatedButton.styleFrom(
    maximumSize: const Size(120, 120),
    backgroundColor: eczaneDarkGrey,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))));

final ButtonStyle button2 = ElevatedButton.styleFrom(
    minimumSize: const Size(200, 40),
    maximumSize: const Size(200, 40),
    backgroundColor: eczaneDarkGrey,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(120))));

final ButtonStyle button3 = ElevatedButton.styleFrom(
    minimumSize: const Size(150, 40),
    maximumSize: const Size(150, 40),
    backgroundColor: eczaneDarkGrey,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(120))));
