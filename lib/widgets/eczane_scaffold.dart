import 'package:flutter/material.dart';

class EczaneScaffold extends StatefulWidget {
  final Widget widget;
  final PreferredSizeWidget? appBar;
  const EczaneScaffold({super.key, required this.widget, this.appBar});

  @override
  State<EczaneScaffold> createState() => _EczaneScaffoldState();
}

class _EczaneScaffoldState extends State<EczaneScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: widget.appBar,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Image.asset('images/arka_plan_üst.png'),
                  const Spacer(),
                  Image.asset('images/arka_plan_alt.png'),
                ],
              ),
              widget.widget,
            ],
          ),
        ));
  }
}
