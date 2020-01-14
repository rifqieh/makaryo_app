import 'package:flutter/material.dart';
import 'package:makaryo_mobile/providers/agendaClass.dart';
import 'package:makaryo_mobile/screens/agenda-screen.dart';

class HomeAgendaItem extends StatelessWidget {
  var _agenda;
  var _color = Colors.amberAccent;
  var _date;
  var _time;
  var _location;

  HomeAgendaItem(Agenda agenda) {
    this._agenda = agenda;
    _color = agenda.getGambar();
    var tmp = agenda.getWaktu();
    _time = "${tmp.getJamMulai()} s/d ${tmp.getJamSelesai()}";
    _date = tmp.getTanggal();
    _location = agenda.getLokasi();
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
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              Container(
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
