
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
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('<<name>>'),
                  IconButton(
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('<<description>>'),
                  IconButton(
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('<<hobby>>'),
                  IconButton(
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('<<country>>'),
                  IconButton(
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('<<regiglion>>'),
                  IconButton(
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}