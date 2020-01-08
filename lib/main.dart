import 'package:flutter/material.dart';
import 'package:makaryo_mobile/screens/login-screen.dart';
import 'package:provider/provider.dart';
import 'screens/home-screen.dart';
import 'providers/theme-changer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.light()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      home: LoginScreen(),
      theme: theme.getTheme(),
    );
  }
}
