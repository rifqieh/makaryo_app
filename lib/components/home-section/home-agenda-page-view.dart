import 'package:flutter/material.dart';

class AgendaPageView extends StatelessWidget {
  var _color = Colors.amberAccent;
  var _date;
  var _time;
  var _location;

  AgendaPageView(this._color, this._date, this._time, this._location);

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
                      Text("Judul Agenda",
                          style: Theme.of(context).textTheme.title),
                      Text("Subjudul Agenda",
                          style: Theme.of(context).textTheme.subtitle)
                    ],
                  ),
                  Divider(),
                  Center(
                    child: Table(
                      children: <TableRow>[
                        TableRow(children: <Widget>[
                          Text("Terbuka Hingga"),
                          Text(_date)
                        ]),
                        TableRow(children: <Widget>[
                          Text("Kuota"),
                          Text("30" + " Peserta")
                        ]),
                        TableRow(
                            children: <Widget>[Text("Waktu"), Text(_time)]),
                        TableRow(
                            children: <Widget>[Text("Tempat"), Text(_location)])
                      ],
                    ),
                  ),
                  Divider(),
                  Text("Deskripsi"),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus auctor laoreet sem, ac semper massa pretium eu. Donec nisi erat, tincidunt ut magna ac, blandit ultricies sapien. Vivamus dapibus enim lorem, nec finibus neque faucibus a. Aenean luctus ac lorem non finibus. Etiam feugiat tristique velit, tristique interdum ligula euismod in. Proin non augue efficitur, malesuada elit sit amet, ultrices nisl. Curabitur iaculis est id nibh consequat, vel egestas urna facilisis. Donec sem tellus, cursus ac augue eget, ornare varius est. Vestibulum cursus placerat lorem, sed convallis odio faucibus id. Etiam vulputate dui sed aliquam vehicula. Etiam eget euismod odio. Praesent finibus quam nec pulvinar auctor. Duis vehicula, justo nec ultrices scelerisque, ipsum eros bibendum nisi, id accumsan metus urna eu arcu. Sed quam nibh, tincidunt et elementum quis, tincidunt eu massa. Proin lacinia diam elementum, tincidunt justo quis, aliquet neque. Praesent tristique, lacus id hendrerit tempus, ante diam varius tellus, a fringilla leo mi commodo enim. Mauris scelerisque tellus vel turpis molestie tincidunt. Phasellus rutrum nibh sit amet tristique rutrum. Quisque arcu mi, elementum nec ex vel, vestibulum auctor lectus. Vivamus malesuada risus erat, in vestibulum elit vestibulum non. Nullam turpis neque, luctus et sem quis, maximus efficitur ex. Nam nec nulla sit amet tellus ultricies bibendum in et arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Etiam in feugiat dolor. Vivamus nec purus at ipsum gravida scelerisque. Praesent at facilisis quam. Donec vel elit lacinia, iaculis lectus vel, accumsan elit. Nulla facilisi. Etiam id fringilla elit, porta ornare ligula. Sed consequat dignissim velit, non laoreet mauris lacinia id. Sed cursus tortor vitae fringilla faucibus. Vestibulum eu purus vehicula, hendrerit dui et, placerat quam. Etiam in pellentesque est, et ornare dui. Duis cursus in ligula quis elementum. Proin non tempor lacus, congue rhoncus orci. Nullam sodales metus arcu, nec vulputate risus maximus ac. Fusce congue rhoncus justo et elementum. Aenean dignissim interdum dignissim. Fusce justo erat, hendrerit ut orci id, convallis ullamcorper nibh. Suspendisse sagittis pharetra massa non faucibus. Nunc ac gravida purus.")
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
