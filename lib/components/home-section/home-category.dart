import 'package:flutter/material.dart';
import 'package:makaryo_mobile/screens/category-list-screen.dart';
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
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: Theme.of(context).buttonTheme.padding,
                child: Text(
                  'MATERI',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              FlatButton(
                child: Text(kategoriList.length < 3 ? '' : 'SELENGKAPNYA'),
                onPressed: kategoriList.length < 3
                    ? null
                    : () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryListScreen()));
                      },
              )
            ],
          ),
          Column(
            children: kategoriList
                .where((k) => kategoriList.indexOf(k) < 3)
                .toList()
                .map((kategori) => HomeCategoryItem(kategori))
                .toList(),
          )
        ],
      ),
    );
  }
}
