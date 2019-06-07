
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profile'),
        ),
      body: Container(
          child: new Column(
            children: <Widget>[
              new Image(
                  alignment: Alignment(0.0, -0.95),
                  image: new AssetImage('assets/default_user_img.png')
              ),
              new Align(
                alignment: Alignment.centerLeft,
                child: Text('<<Name>>', style: new TextStyle(fontSize: 20),),
              ),
              new Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '<<Description>>', style: new TextStyle(fontSize: 16),)
              )
            ],
          )
      ),
    );
  }
}