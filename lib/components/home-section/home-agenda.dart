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
      margin: EdgeInsets.only(top: 20, bottom: 20),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: Theme.of(context).buttonTheme.padding,
                child: Text(
                  'AGENDA',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              FlatButton(
                child: Text(agendaList.length < 3 ? "" : 'SELENGKAPNYA'),
                onPressed: agendaList.length < 3
                    ? null
                    : () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AgendaListScreen()));
                      },
              ),
            ],
          ),
          Column(
            children: agendaList
                .where((a) => agendaList.indexOf(a) < 3)
                .toList()
                .map((agenda) => HomeAgendaItem(agenda))
                .toList(),
          )
        ],
      ),
    );
  }
}
