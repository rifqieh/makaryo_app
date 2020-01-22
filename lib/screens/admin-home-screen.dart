import 'package:flutter/material.dart';
import 'package:makaryo_mobile/components/admin-section/add-category-card.dart';
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
          CategoryCard(0),
          CategoryCard(1),
          CategoryCard(2),
          CategoryCard(3),
          AddCategoryCard(),
        ],
      ),
    );
  }
}
