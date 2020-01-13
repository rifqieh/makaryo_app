import 'package:flutter/material.dart';
import 'package:makaryo_mobile/screens/dummyData.dart';
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
                FlatButton(
                  child: Text('SELENGKAPNYA'),
                  onPressed: () {},
                ),
              ],
            ),
            Column(
              children: kategoriList
                  .map((kategori) => HomeCategoryItem(kategori))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
