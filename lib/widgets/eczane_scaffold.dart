import 'package:flutter/material.dart';

class EczaneScaffold extends StatefulWidget {
  final Widget widget;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  const EczaneScaffold(
      {super.key, required this.widget, this.appBar, this.bottomNavigationBar});

  @override
  State<EczaneScaffold> createState() => _EczaneScaffoldState();
}

class _EczaneScaffoldState extends State<EczaneScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        appBar: widget.appBar,
        bottomNavigationBar: widget.bottomNavigationBar,
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
