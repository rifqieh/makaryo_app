import 'package:flutter/material.dart';
import 'package:makaryo_mobile/providers/agendaClass.dart';
import 'package:makaryo_mobile/screens/agenda-screen.dart';

class HomeAgendaItem extends StatelessWidget {
  var _agenda;
  var _color = Colors.amberAccent;
  var _date, _time, _location, _name;

  HomeAgendaItem(Agenda agenda) {
    this._agenda = agenda;
    _color = agenda.getGambar();
    var tmp = agenda.getWaktu();
    _time = "${tmp.getJamMulai()} s/d ${tmp.getJamSelesai()}";
    _date = tmp.getTanggal();
    _location = agenda.getLokasi();
    _name = agenda.getNamaAcara();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AgendaScreen(_agenda)));
        },
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: _color,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _name,
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text(
                        _date + " " + _time + "\n" + _location,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
