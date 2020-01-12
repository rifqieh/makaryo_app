import 'package:flutter/material.dart';
import 'package:makaryo_mobile/components/home-section/home-agenda-page-view.dart';

class HomeAgendaItem extends StatelessWidget {
  var _color = Colors.amberAccent;
  var _date;
  var _time;
  var _location;

  HomeAgendaItem(this._color, this._date, this._time, this._location);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
// <<<<<<< user-ui
//       clipBehavior: Clip.antiAlias,
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) =>
//                       AgendaPageView(_color, _date, _time, _location)));
//         },
//         child: Container(
//           margin: EdgeInsets.symmetric(vertical: 10),
//           padding: EdgeInsets.all(20),
//           child: Row(
//             children: <Widget>[
//               Container(
//                 height: 90,
//                 child: AspectRatio(
//                   aspectRatio: 2 / 1,
//                   child: Container(
//                     color: _color,
//                   ),
// =======
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
// >>>>>>> master
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
        ),
      ),
    );
  }
}
