import 'package:flutter/material.dart';
import 'package:ntupartner/ui/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NTUpartner',
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new SplashScreen(),
    );
  }
}
