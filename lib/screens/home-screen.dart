import 'package:flutter/material.dart';
import 'package:makaryo_mobile/components/home-section/home-agenda.dart';
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
        selectedItemColor: Color(0xff6980C5),
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
      color: Color(0xffF7F6EE),
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
        color: Color(0xffF7F6EE),
        child: Center(
          child: Text("Notifikasi"),
        ));
  }
}

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffF7F6EE),
        child: Center(
          child: Text("Profil"),
        ));
  }
}
