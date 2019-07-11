
import 'package:flutter/material.dart';

import 'package:ntupartner/model/user_model.dart';

class ProfilePage extends StatefulWidget {
  final UserModel user;
  ProfilePage({Key key, @required this.user}) : super(key: key);
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
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
                  Text(widget.user.fullname),
                  IconButton(
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(widget.user.description),
                  IconButton(
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(widget.user.hobbies),
                  IconButton(
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(widget.user.country_of_origin),
                  IconButton(
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(widget.user.religion),
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

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Profile"),
      centerTitle: true,
    );
  }
}