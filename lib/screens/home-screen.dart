import 'dart:math';

import 'package:flutter/material.dart';
import 'package:makaryo_mobile/color.dart';
import 'package:makaryo_mobile/components/home-section/home-agenda.dart';
import 'package:makaryo_mobile/screens/dummyData.dart';
import 'package:makaryo_mobile/screens/edit-profile-screen.dart';
import 'package:makaryo_mobile/screens/login-screen.dart';
import 'package:pie_chart/pie_chart.dart';
import '../components/home-section/home-category.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> homeScreenList = [
    BerandaScreen(),
    NotifikasiScreen(),
    ProfilScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeScreenList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Beranda'),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search),
          //   title: Text('Pencarian'),
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifikasi'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HomeCategory(),
              HomeAgenda(),
            ],
          ),
        ),
      ),
    );
  }
}

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: ListView.builder(
            itemCount: notifikasiList.length,
            itemBuilder: (context, index) {
              var item = notifikasiList[index];
              return Dismissible(
                key: Key(Random().nextInt(index + 1).toString()),
                child: Card(
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text(item.message),
                      subtitle: Text(
                        item.time.difference(DateTime.now()).inHours.toString(),
                      ),
                      enabled: true,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = Map.fromIterable(kategoriList,
        key: (k) => k.getKategoriName(), value: (k) => k.getPercentage());
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Color.fromRGBO(0, 0, 0, 0),
              elevation: 0,
              actions: <Widget>[
                PopupMenuButton(
                  onSelected: (selected) => _select(context, selected),
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black87,
                  ),
                  itemBuilder: (context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      value: 0,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.edit,
                            color: Colors.black87,
                          ),
                          VerticalDivider(),
                          Text("Ubah Profil"),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.exit_to_app,
                            color: Colors.black87,
                          ),
                          VerticalDivider(),
                          Text("Log Out"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: (1 / 6) * deviceWidth,
                      ),
                      backgroundColor: primaryColor,
                      radius: (1 / 8) * deviceWidth,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Mohammad Talha",
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          "mx@email.com",
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                height: (1 / 4) * deviceHeight,
                                child: PieChart(
                                  chartType: ChartType.ring,
                                  dataMap: dataMap,
                                  showLegends: false,
                                ),
                              ),
                              VerticalDivider(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Progres Belajar",
                                    softWrap: true,
                                  ),
                                  Text(
                                    "75%",
                                    style: Theme.of(context)
                                        .textTheme
                                        .display3
                                        .copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                  RaisedButton(
                                    onPressed: () {},
                                    child: Text("LANJUTKAN"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _select(BuildContext context, var selected) {
    switch (selected) {
      case 0:
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditProfileScreen()));
        break;
    }
  }
}
