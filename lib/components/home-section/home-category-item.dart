import 'package:flutter/material.dart';
import 'package:makaryo_mobile/providers/kategoriClass.dart';
import 'package:makaryo_mobile/screens/category-screen.dart';

class HomeCategoryItem extends StatelessWidget {
  Kategori kategori;
  var _color;
  var _text;
  var _percen;

  HomeCategoryItem(this.kategori) {
    _color = kategori.getColor();
    _text = kategori.getKategoriName();
    _percen = kategori.getPercentage();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategoryScreen(kategori)));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(_text),
                          Text('${_percen * 100}%'),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 250,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Container(
                          width: 250 * _percen,
                          height: 20,
                          decoration: BoxDecoration(
                            color: _color,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
