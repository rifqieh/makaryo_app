import 'package:flutter/material.dart';
import 'package:makaryo_mobile/components/home-section/home-agenda-item.dart';
import './home-category-item.dart';

class HomeAgenda extends StatelessWidget {
  const HomeAgenda({
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
                  'AGENDA',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text('SELENGKAPNYA'),
              ],
            ),
            HomeAgendaItem(Colors.amberAccent, '20 Januari 2020',
                '08.00 - 14.00', 'Kamayangan Cafe'),
            HomeAgendaItem(Colors.blueAccent, '24 Februari 2020',
                '10.00 - 15.00', 'Auditorium UNS'),
          ],
        ),
      ),
    );
  }
}
