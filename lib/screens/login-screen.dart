import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makaryo_mobile/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makaryo_mobile/screens/admin-home-screen.dart';
import 'package:makaryo_mobile/screens/home-screen.dart';
import 'package:makaryo_mobile/screens/register-screen.dart';

Color textColor = Color(0xff6980C5);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _visiblePassword = false;
  var _email;

  setVisiblePassword() {
    print(_visiblePassword);
    setState(() {
      _visiblePassword = !_visiblePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
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
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      _email = value;
                    });
                  },
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        (_visiblePassword == false
                            ? Icons.visibility
                            : Icons.visibility_off),
                        color: textColor,
                      ),
                      onPressed: () {
                        setVisiblePassword();
                      },
                    ),
                  ),
                  obscureText: _visiblePassword == false ? true : false,
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
                  onPressed: () {
                    if (_email == 'admin') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminHomeScreen()));
                    } else {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    }
                  },
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
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
      ),
    );
  }
}
