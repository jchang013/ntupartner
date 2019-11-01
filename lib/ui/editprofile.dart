
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import 'package:ntupartner/ui/profile.dart';

import 'package:ntupartner/model/user_model.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel user;
  EditProfilePage({Key key, @required this.user}) : super(key: key);
  State<StatefulWidget> createState() {
    return _EditPageState();
  }
}


class _EditPageState extends State<EditProfilePage> {

  final dobFormats = {
    InputType.date: DateFormat('dd-MM-yyyy'),
  };

  InputType inputType = InputType.date;

  static DateTime initDob;
  static String initDescription;
  static String initCountry;
  static String initReligion;
  static String initCos;
  static int initYom;

  @override
  void initState() {
    super.initState();
    initDescription = widget.user.description;

  }

  TextEditingController _descriptionFilter = new TextEditingController(text: initDescription);
  TextEditingController _cosFilter = new TextEditingController();
  TextEditingController _yomFilter = new TextEditingController();

  String _description = '';

  bool _emptyDescriptionField = false;

  _EditPageState() {
    _descriptionFilter.addListener(_descriptionListen);
  }

  void _descriptionListen() {
    _description = _descriptionFilter.text;
  }

    @override
    Widget build(BuildContext context) {
      return new WillPopScope(
        onWillPop: () async => false,
          child: new Scaffold(
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
                      child: TextField(
                        controller: _descriptionFilter,
                        decoration: new InputDecoration(
                            errorText: _emptyDescriptionField ? 'Field Can\'t Be Empty' : null
                        ),
                      ),
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
                    new Divider(height: 18.0,color: Colors.transparent,),
                    _buildButtons(),
                  ],
                )
              ),
            )
          );
      }
  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Edit Profile"),
      automaticallyImplyLeading: false,
      centerTitle: true,
    );
  }

  Widget _buildButtons() {

    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new RaisedButton(
              child: new Text('Save changes'),
              onPressed: _savePressed
          ),
          new RaisedButton(
              child: new Text('Discard changes and back'),
              onPressed: _discardPressed
          ),
        ],
      ),
    );
  }

  void _savePressed () {
    print('Saving changes');

  }

  void _discardPressed () {
    print('Discarding changes and back');

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage(user: widget.user)));
  }

}


