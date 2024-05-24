import 'package:e_czane/constants.dart';
import 'package:flutter/material.dart';

class EczaneScaffold extends StatefulWidget {
  final Widget widget;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  const EczaneScaffold(
      {super.key,
      required this.widget,
      this.appBar,
      this.bottomNavigationBar,
      this.floatingActionButton});

  @override
  State<EczaneScaffold> createState() => _EczaneScaffoldState();
}

class _EczaneScaffoldState extends State<EczaneScaffold> {
  @override
  Widget build(BuildContext context) {
    DeviceSize.init(context);
    return Scaffold(
        //scaffold widget'ı
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: widget
            .appBar, //scaffold sayfaya eklenirken dışardan alınan appbar widget'ı
        bottomNavigationBar: widget
            .bottomNavigationBar, //scaffold sayfaya eklenirken dışardan alınan bottom navigation bar widget'ı
        floatingActionButton: widget.floatingActionButton,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'images/arka_plan_üst.png',
                    width: DeviceSize.width,
                  ),
                  const Spacer(),
                  Image.asset(
                    'images/arka_plan_alt.png',
                    width: DeviceSize.width,
                  ),
                ],
              ),
              widget.widget,
            ],
          ),
        ));
  }
}
