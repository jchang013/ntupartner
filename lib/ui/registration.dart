import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:ntupartner/common/functions/getCurrentYear.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameFilter = new TextEditingController();
  final TextEditingController _nameFilter = new TextEditingController();
  final TextEditingController _descriptionFilter = new TextEditingController();
  final TextEditingController _cosFilter = new TextEditingController();
  final TextEditingController _yomFilter = new TextEditingController();
  final TextEditingController _instagramFilter = new TextEditingController();

  final dobFormats = {
    InputType.date: DateFormat('dd-MM-yyyy'),
  };

  InputType inputType = InputType.date;

  String _username = "";
  String _gender = "Male";
  String _name = "";
  DateTime _dob;     //Date of birth
  String _description = "";
  String _country = "-------";
  String _religion = "-------";
  String _cos = "";   //course of study
  int _yom = (getCurrentYear() + 2);   //year of matriculation
  String _yomS = "";
  String _instagram = '';

  bool _emptyUsernameField = false;
  bool _emptyNameField = false;
  bool _emptyDescriptionField = false;
  bool _emptyCosField = false;
  bool _emptyYomField = false;
  bool _emptyInstaField = false;


  _RegistrationPageState() {
    _usernameFilter.addListener(_usernameListen);
    _nameFilter.addListener(_nameListen);
    _descriptionFilter.addListener(_descriptionListen);
    _cosFilter.addListener(_cosListen);
    _yomFilter.addListener(_yomListen);
    _instagramFilter.addListener(_instagramListen);
  }

  void _usernameListen() {
    _username = _usernameFilter.text;
  }

  void _nameListen() {
    _name = _nameFilter.text;
  }

  void _descriptionListen() {
    _description = _descriptionFilter.text;
  }

  void _cosListen() {
    _cos = _cosFilter.text;
  }

  void _yomListen() {
    _yomS = _yomFilter.text;
  }

  void _instagramListen() {
    _instagram = _instagramFilter.text;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/Login_background.jpg"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black38,
        ),
        new ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            _buildFields(),
            _buildButtons(),
          ],
        ),
        ]
      )
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("NTUpartner"),
      centerTitle: true,
    );
  }

  Widget _buildFields() {
    return new Container(
      child: new Column(

        children: <Widget>[
          new Container(
            child: new TextField(
              style: TextStyle(color: Colors.white),
              controller: _usernameFilter,
              decoration: new InputDecoration(
                labelText: 'Username',
                labelStyle: new TextStyle(color: Colors.white),
                errorText: _emptyUsernameField ? 'Field Can\'t Be Empty' : null,
              ),
            ),
          ),
          new Divider(height: 15.0,color: Colors.transparent,),
          new Container(
            child: new TextField(
              style: TextStyle(color: Colors.white),
              controller: _nameFilter,
              decoration: new InputDecoration(
                labelText: 'Your Name',
                labelStyle: new TextStyle(color: Colors.white),
                errorText: _emptyNameField ? 'Field Can\'t Be Empty' : null,
              ),
            ),
          ),
          new Divider(height: 15.0,color: Colors.transparent,),
          new Container(
            child: new TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(
                  color: Colors.white,
                  height: 1.5,
              ),
              controller: _descriptionFilter,
              decoration: new InputDecoration(
                labelText: 'Describe Yourself',
                labelStyle: new TextStyle(color: Colors.white),
                errorText: _emptyDescriptionField ? 'Field Can\'t Be Empty' : null,
              ),
            ),
          ),
          new Divider(height: 15.0,color: Colors.transparent,),
          new DateTimePickerFormField(
            inputType: inputType,
            style: TextStyle(color: Colors.white),
            format: DateFormat('d MMMM yyyy'),
            editable: false,
            decoration: InputDecoration(
                labelText: 'Date of birth',
                labelStyle: new TextStyle(color: Colors.white),
                hasFloatingPlaceholder: false),
            onChanged: (dt) => setState(() => _dob = dt),
          ),
          new Divider(height: 15.0,color: Colors.transparent,),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Gender: ', style: TextStyle(fontSize: 18, color: Colors.white),),
              Container(
                color: Colors.white24,
                child: DropdownButton<String>(
                  style: TextStyle(color: Colors.black),
                  value: _gender,
                  onChanged: (String newValue) {
                    setState(() {
                    _gender = newValue;
                      });
                    },
                  items: <String>['Male', 'Female', 'Others']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })
                      .toList(),
                  ),
              )
            ],
          ),
          new Divider(height: 15.0,color: Colors.transparent,),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Country of origin: ', style: TextStyle(fontSize: 18, color: Colors.white),),
              Container(
                color: Colors.white24,
                child: DropdownButton<String>(
                  style: TextStyle(color: Colors.black),
                  value: _country,
                  onChanged: (String newValue) {
                  setState(() {
                    _country = newValue;
                  });
                },
                items: <String>['-------', 'Singapore', 'Others']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                    .toList(),
                ),
              )
            ],
          ),
          new Divider(height: 15.0,color: Colors.transparent,),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Religion: ', style: TextStyle(fontSize: 18, color: Colors.white),),
              Container(
                color: Colors.white24,
                child: DropdownButton<String>(
                  style: TextStyle(color: Colors.black),
                  value: _religion,
                  onChanged: (String newValue) {
                  setState(() {
                    _religion = newValue;
                  });
                },
                items: <String>['-------',
                                'Agnostic',
                                'Atheist',
                                'Buddhism',
                                'Catholicism',
                                'Christianity',
                                'Hinduism',
                                'Islam',
                                'Protestantism',
                                'Others']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                    .toList(),
                ),
              )
            ],
          ),
          new Divider(height: 15.0,color: Colors.transparent,),
          new Container(
            child: new TextField(
              style: TextStyle(color: Colors.white),
              controller: _cosFilter,
              decoration: new InputDecoration(
                labelText: 'Course of study',
                labelStyle: new TextStyle(color: Colors.white),
                errorText: _emptyCosField ? 'Field Can\'t Be Empty' : null,
              ),
            ),
          ),
          new Divider(height: 15.0,color: Colors.transparent,),
          new Container(
            child: new TextField(
              style: TextStyle(color: Colors.white),
              controller: _yomFilter,
              decoration: new InputDecoration(
                labelText: 'Year of matriculation',
                labelStyle: new TextStyle(color: Colors.white),
                errorText: _emptyYomField ? 'Field Can\'t Be Empty' : null,
              ),
            ),
          ),
          new Divider(height: 20.0,color: Colors.transparent,),

        ],
      ),
    );
  }

  Widget _buildButtons() {

    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
              child: new Text('Register!'),
              onPressed: () {
                setState(() {
                  //check field
                  _createAccountPressed();
                });
              }
          ),
        ],
      ),
    );

  }

  void _createAccountPressed () {


    print('Registering with \n '
        '$_username as username \n'
        '$_name as name \n'
        '$_description as description \n'
        '$_dob as date of birth \n'
        '$_gender as gender \n'
        '$_cos as course of study \n' );
  }

}

enum Gender {
  male,
  female,
  others
}