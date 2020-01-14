import 'package:flutter/material.dart';
import 'package:makaryo_mobile/providers/agendaClass.dart';

class AgendaScreen extends StatelessWidget {
  var _color = Colors.amberAccent;
  var _date, _time, _location, _desc, _image, _name, _sub;

  AgendaScreen(Agenda agenda) {
    _color = agenda.getGambar();
    var tmp = agenda.getWaktu();
    _time = "${tmp.getJamMulai()} s/d ${tmp.getJamSelesai()}";
    _date = tmp.getTanggal();
    _location = agenda.getLokasi();
    _desc = agenda.getDeskripsi();
    _name = agenda.getNamaAcara();
    _sub = agenda.getPenyelenggara();
    _image = agenda.getGambar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: BackButton(),
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(color: _color),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_name, style: Theme.of(context).textTheme.title),
                      Text("Diselenggarakan oleh $_sub",
                          style: Theme.of(context).textTheme.subtitle)
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                      child: Table(
                        children: <TableRow>[
                          TableRow(
                            children: <Widget>[
                              Text("Waktu"),
                              Text(_date),
                            ],
                          ),
                          TableRow(
                            children: <Widget>[
                              Text(''),
                              Text(_time),
                            ],
                          ),
                          TableRow(children: <Widget>[
                            Text("Tempat"),
                            Text(_location)
                          ])
                        ],
                      ),
                    ),
                  ),
                  Text("Deskripsi"),
                  Text(_desc),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: () {},
      ),
    );
  }
}
