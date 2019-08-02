
import 'package:flutter/material.dart';

import 'package:ntupartner/model/user_model.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel user;
  EditProfilePage({Key key, @required this.user}) : super(key: key);
  State<StatefulWidget> createState() {
    return _EditPageState();
  }
}


  class _EditPageState extends State<EditProfilePage> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: _buildBar(context),
        body: Container(
            child: new ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[

                new Divider(height: 18.0,color: Colors.transparent,),
                new Align(
                  alignment: Alignment.centerLeft,
                  child: Text('${widget.user.fullname}', style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
  }


  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Edit Profile"),
      centerTitle: true,
    );
  }