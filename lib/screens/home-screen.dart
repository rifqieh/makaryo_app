import 'package:flutter/material.dart';
import 'package:makaryo_mobile/color.dart';
import 'package:makaryo_mobile/components/home-section/home-agenda.dart';
import 'package:makaryo_mobile/screens/login-screen.dart';
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
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 80),
              child: Column(
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: (1 / 8) * deviceWidth,
                    ),
                  ),
                  Text(
                    "Mohammad Talha",
                    style: Theme.of(context).textTheme.title,
                  ),
                  FlatButton(
                    child: Text("LOG OUT"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                  )
                ],
              ),
            ),
            Container(
                child: Center(
              child: Text("Profil"),
            ))
          ],
        ),
      ),
    );
  }
}
