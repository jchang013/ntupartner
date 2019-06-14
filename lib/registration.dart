import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameFilter = new TextEditingController();
  final TextEditingController _nameFilter = new TextEditingController();
  final TextEditingController _descriptionFilter = new TextEditingController();
  final TextEditingController _cosFilter = new TextEditingController();

  String _username = "";
  String _gender = "";
  String _name = "";
  String _dob = "";     //Date of birth
  String _description = "";
  String _country = "";
  String _religion = "";
  String _cos = "";   //course of study
  String _yom = "";   //year of matriculation

  bool _emptyUsernameField = false;
  bool _emptyNameField = false;
  bool _emptyDescriptionField = false;
  bool _emptyCosField = false;

  _RegistrationPageState() {
    _usernameFilter.addListener(_usernameListen);
    _nameFilter.addListener(_nameListen);
    _descriptionFilter.addListener(_descriptionListen);
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
        new Container(
          padding: EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              _buildFields(),
              _buildButtons(),
            ],
          ),
        ),
      ]),
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
          )
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
        '$_description as description');
  }

}

enum Gender {
  male,
  female,
  others
}