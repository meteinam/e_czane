import 'package:e_czane/constants.dart';
import 'package:e_czane/widgets/eczane_buttons.dart';
import 'package:flutter/material.dart';

class EczaneListView extends StatefulWidget {
  const EczaneListView({super.key});

  @override
  State<EczaneListView> createState() => _EczaneListViewState();
}

class _EczaneListViewState extends State<EczaneListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GridViewButton(
              title: 'Yakınımdaki Eczaneler',
              onPressed: () {
                Navigator.popAndPushNamed(context, '/PharmacyNearbyPage');
              },
            ),
            GridViewButton(
              title: 'Nöbetçi Eczaneler',
              onPressed: () {},
            ),
          ],
        ),
        GridViewButton(
          width: DeviceSize.width,
          title: 'İlaçlarım',
          onPressed: () {
            Navigator.popAndPushNamed(context, '/MedicinePage');
          },
        )
      ],
    );

    // GridView.count(
    //   crossAxisCount: 2,
    //   mainAxisSpacing: 10.0,
    //   crossAxisSpacing: 10.0,
    //   padding: const EdgeInsets.all(10.0),
    //   children: <Widget>[

    //   ],
    // );
  }
}
