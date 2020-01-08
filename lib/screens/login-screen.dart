import 'package:flutter/material.dart';

Color textColor = Color(0xff6980C5);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo-flat.png'),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: textColor),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: textColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: textColor),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: textColor,
                    ),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: textColor,
                    )),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: textColor,
              ),
              child: FlatButton(
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: textColor),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: FlatButton(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: textColor),
                ),
              ),
            ),
            Text(
              'Forgot Password?',
              style: TextStyle(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
