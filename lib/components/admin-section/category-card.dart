import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  var _backgroundColor;
  var _count;
  var _text;

  CategoryCard(this._backgroundColor, this._count, this._text);

  @override
  Widget build(BuildContext context) {
    var cardWidth = (MediaQuery.of(context).size.width - 60) / 2;

    return Card(
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
        ));
  }
}
