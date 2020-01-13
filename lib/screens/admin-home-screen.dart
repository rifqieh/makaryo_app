import 'package:flutter/material.dart';
import 'package:makaryo_mobile/components/admin-section/agenda-card.dart';
import 'package:makaryo_mobile/components/admin-section/category-card.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
        children: <Widget>[
          CategoryCard(Colors.amberAccent, 60, 'Kuliner'),
          CategoryCard(Colors.blueAccent, 24, 'Fesyen'),
          CategoryCard(Colors.redAccent, 36, 'Kerajinan'),
          CategoryCard(Colors.greenAccent, 12, 'Motivasi'),
          AgendaCard(),
        ],
      ),
    );
  }
}
