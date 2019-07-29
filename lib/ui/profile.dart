
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
    String imageURL = 'http://172.21.148.187:8000' + widget.user.avatar_url;

    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
          child: new Column(
            children: <Widget>[
              new Image.file(
                  widget.user.image
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(widget.user.fullname.toString()),
                  IconButton(
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(widget.user.description.toString()),
                  IconButton(
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(widget.user.hobbies.toString()),
                  IconButton(
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(widget.user.country_of_origin.toString()),
                  IconButton(
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(widget.user.religion.toString()),
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