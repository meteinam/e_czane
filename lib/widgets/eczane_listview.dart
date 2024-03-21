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
    return GridView.count(
      crossAxisCount: 2, // 2 sütunlu GridViewButtond
      mainAxisSpacing: 10.0, // Dikey boşluk
      crossAxisSpacing: 10.0, // Yatay boşluk
      padding: const EdgeInsets.all(10.0),
      children: const <Widget>[
        GridViewButton(title: 'Bilgilerim'),
        GridViewButton(title: 'İlaçlarım'),
        GridViewButton(title: 'Yakınımdaki Eczaneler'),
        GridViewButton(title: 'Nöbetçi Eczaneler'),
        GridViewButton(title: 'İlaç Araması'),
        GridViewButton(title: 'Reçete Talebi'),
      ],
    );
  }
}
