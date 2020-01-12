import 'package:flutter/material.dart';

class HomeAgendaItem extends StatelessWidget {
  var _color = Colors.amberAccent;
  var _date;
  var _time;
  var _location;

  HomeAgendaItem(this._color, this._date, this._time, this._location);

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
            height: 90,
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: Container(
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            height: 90,
            child: Column(
              children: <Widget>[
                Text(
                  'Waktu:',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  _date,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  _time,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Tempat:',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  _location,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
