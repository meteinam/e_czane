import 'package:flutter/material.dart';

Padding eczaneSmallPadding = const Padding(padding: EdgeInsets.all(5));
Padding eczaneMidPadding = const Padding(padding: EdgeInsets.all(15));
Padding eczaneBigPadding = const Padding(padding: EdgeInsets.all(25));

class DeviceSize {
  static double height = 0;
  static double width = 0;
  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
