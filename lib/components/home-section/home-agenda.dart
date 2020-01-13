import 'package:flutter/material.dart';
import 'package:makaryo_mobile/components/home-section/home-agenda-item.dart';
import 'package:makaryo_mobile/screens/agenda-list-screen.dart';
import 'package:makaryo_mobile/screens/dummyData.dart';
import 'home-agenda-item.dart';

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
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgendaListScreen()));
                  },
                  child: Text('SELENGKAPNYA'),
                ),
              ],
            ),
            Column(
              children: agendaList
                  .where((a) => agendaList.indexOf(a) < 2)
                  .toList()
                  .map((agenda) => HomeAgendaItem(agenda))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
