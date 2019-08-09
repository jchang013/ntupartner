
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:convert';

import 'package:ntupartner/ui/editprofile.dart';

import 'package:ntupartner/model/user_model.dart';
import 'package:ntupartner/common/functions/getCurrentYear.dart';

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
    //Uint8List _bytesImage;
    //_bytesImage = base64.decode(test);

    String imageURL = 'http://172.21.148.187:8000' + widget.user.avatar_url;
    int birthyear = int.parse(widget.user.date_of_birth.substring(0,4));
    int age = getCurrentYear() - birthyear;

    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
          child: new ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              _buildImage(),
              //new Image.memory(_bytesImage),
              new Divider(height: 18.0,color: Colors.transparent,),
              new Align(
                alignment: Alignment.centerLeft,
                child: Text('${widget.user.fullname}, $age', style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              new Divider(height: 18.0,color: Colors.transparent,),
              new Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description', style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              new Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.user.description, style: new TextStyle(fontSize: 16,),),
              ),
              new Divider(height: 18.0,color: Colors.transparent,),
              new Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hobbies', style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              new Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.user.hobbies, style: new TextStyle(fontSize: 16,),),
              ),
              new Divider(height: 18.0,color: Colors.transparent,),
              new Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Country of Origin', style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              new Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.user.country_of_origin, style: new TextStyle(fontSize: 16,),),
              ),
              new Divider(height: 18.0,color: Colors.transparent,),
              new Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Religion', style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              new Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.user.religion, style: new TextStyle(fontSize: 16,),),
              ),
              new Divider(height: 18.0,color: Colors.transparent,),
              new Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Course of Study', style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              new Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${widget.user.course_of_study}, ${widget.user.year_of_matriculation}', style: new TextStyle(fontSize: 16,),),
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
      //automaticallyImplyLeading: false,
      actions: <Widget> [
        IconButton(
            icon: Icon(Icons.edit),
          onPressed: () {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => EditProfilePage(user: widget.user)));
        }
      )
    ]
    );
  }

  Widget _buildImage() {
    if (widget.user.imageBytes == null) {
      return new Image(
          alignment: Alignment(0.0, -0.95),
          image: new AssetImage('assets/default_user_img.png')
      );
    } else {
      return new Image.memory(
          widget.user.imageBytes
      );
    }
  }
}