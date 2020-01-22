import 'package:flutter/material.dart';
import 'package:makaryo_mobile/screens/category-list-admin-screen.dart';
import 'package:makaryo_mobile/screens/dummyData.dart';

class CategoryCard extends StatelessWidget {
  var _index;

  CategoryCard(this._index);

  @override
  Widget build(BuildContext context) {
    var _backgroundColor = kategoriList[_index].getColor();
    var _text = kategoriList[_index].getKategoriName();
    var _count = kategoriList[_index].getPercentage() * 100;
    var cardWidth = (MediaQuery.of(context).size.width - 60) / 2;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryListAdminScreen(kategoriList[_index])));
      },
      child: Card(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 150,
                color: _backgroundColor,
                child: Center(
                  child: Text(
                    '$_count',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text(
                  _text,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
