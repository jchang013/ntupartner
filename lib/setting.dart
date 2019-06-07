import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _SettingPageState();
  }
}


class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Settings"),
          ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ]
          )
        ),
      )
    );
  }
}
