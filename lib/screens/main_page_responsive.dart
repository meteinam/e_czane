import 'package:e_czane/constants.dart';
import 'package:e_czane/widgets/eczane_appbar.dart';
import 'package:e_czane/widgets/eczane_listview.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:flutter/material.dart';

class EczaneResponsiveMainPage extends StatelessWidget {
  const EczaneResponsiveMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceSize.init(context);
    return EczaneScaffold(
      appBar: EczaneAppbar(
        backButtonPressed: () {
          Navigator.popAndPushNamed(context, '/MyHomePage');
        },
      ),
      widget: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                  width: DeviceSize.width,
                  height: DeviceSize.height * 0.65,
                  child: const EczaneListView()),
              SizedBox(
                width: DeviceSize.width,
                height: DeviceSize.height * 0.05,
              )
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                  width: DeviceSize.width,
                  height: DeviceSize.height * 0.55,
                  child: const EczaneListView()),
              SizedBox(
                width: DeviceSize.width,
                height: DeviceSize.height * 0.1,
              )
            ],
          );
        }
      }),
    );
  }
}
