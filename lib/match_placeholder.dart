import 'package:flutter/material.dart';

class PlaceholderUser extends StatefulWidget {
  @override
  _PlaceholderUserState createState() => _PlaceholderUserState();
}

class _PlaceholderUserState extends State<PlaceholderUser> {
  @override
  Widget build(BuildContext context) {
    //To add if else statement to control when there is a daily match or not
    return new Container(
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
            alignment: Alignment.bottomCenter,
            child: Text('<<Description>>', style: new TextStyle(fontSize: 16),)
          )
        ],
      )
    );
  }
}