import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  var _color;
  var _text;
  var _percen;

  HomeCategoryItem(this._color, this._text, this._percen);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
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
    );
  }
}
