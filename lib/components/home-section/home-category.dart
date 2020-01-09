import 'package:flutter/material.dart';
import './home-category-item.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'KATEGORI',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text('SELENGKAPNYA'),
              ],
            ),
            HomeCategoryItem(Colors.amberAccent, 'Kuliner', 0.7),
            HomeCategoryItem(Colors.blueAccent, 'Fesyen', 0.4),
            HomeCategoryItem(Colors.redAccent, 'Kerajinan', 0.2),
            HomeCategoryItem(Colors.greenAccent, 'Motivasi', 0.1),
          ],
        ),
      ),
    );
  }
}
