import 'package:flutter/material.dart';

import 'package:ntupartner/ui/mainpage.dart';
import 'package:ntupartner/ui/passreset.dart';
import 'package:ntupartner/ui/registration.dart';

import 'package:ntupartner/common/api_functions/callLogin.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  final TextEditingController _passwordConfirmFilter = new TextEditingController();

  String _username = "";
  String _password = "";
  String _passwordConfirm = "";

  bool _emptyUsernameField = false;
  bool _emptyPassField = false;
  bool _emptyPassConfirmField = false;

  FormType _form = FormType.login;

  _LoginPageState() {
    _usernameFilter.addListener(_usernameListen);
    _passwordFilter.addListener(_passwordListen);
    _passwordConfirmFilter.addListener(_passwordConfirmListen);
  }

  void _usernameListen() {
    _username = _usernameFilter.text;
  }

  void _passwordListen() {
    _password = _passwordFilter.text;
  }

  void _passwordConfirmListen() {
    _passwordConfirm = _passwordConfirmFilter.text;
  }

  void _formChange () async {
    setState(() { //2 Different states, login or register
      if (_form == FormType.register) {
        _form = FormType.login;
      }
      else {
        _form = FormType.register;
      }
    });
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
              _buildTextFields(),
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

  Widget _buildTextFields() {
    if (_form == FormType.login) {
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
                controller: _passwordFilter,
                decoration: new InputDecoration(
                    labelText: 'Password',
                    labelStyle: new TextStyle(color: Colors.white),
                    errorText: _emptyPassField ? 'Field Can\'t Be Empty' : null,
                ),
                obscureText: true,
              ),
            )
          ],
        ),
      );
    }
    else {
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
                controller: _passwordFilter,
                decoration: new InputDecoration(
                    labelText: 'Password',
                    labelStyle: new TextStyle(color: Colors.white),
                    errorText: _emptyPassField ? 'Field Can\'t Be Empty' : null,
                ),
                obscureText: true,
              ),
            ),
            new Container(
              child: new TextField(
                style: TextStyle(color: Colors.white),
                controller: _passwordConfirmFilter,
                decoration: new InputDecoration(
                    labelText: 'Comfirm Password',
                    labelStyle: new TextStyle(color: Colors.white),
                    errorText: _emptyPassConfirmField ? 'Field Can\'t Be Empty' : null,
                ),
                obscureText: true,
              ),
            )
          ],
        ),
      );
    }
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: () {
                setState(() {
                  _usernameFilter.text.isEmpty ? _emptyUsernameField = true : _emptyUsernameField = false;
                  _passwordFilter.text.isEmpty ? _emptyPassField = true : _emptyPassField = false;
                  if (_emptyUsernameField == false && _emptyPassField == false){
                    _loginPressed ();
                  } else {
                    print('Empty email or pass field on logging in');
                  }
                });
              }
            ),
            new FlatButton(
              child: new Text('Dont have an account yet? Tap here to register.',
                  style: TextStyle(color: Colors.white)),
              onPressed: _formChange,
            ),
            new FlatButton(
              child: new Text('Forgot Password? Tap here to reset.',
                  style: TextStyle(color: Colors.white)),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Create an Account'),
              onPressed: () {
                setState(() {
                  _usernameFilter.text.isEmpty ? _emptyUsernameField = true : _emptyUsernameField = false;
                  _passwordFilter.text.isEmpty ? _emptyPassField = true : _emptyPassField = false;
                  _passwordConfirmFilter.text.isEmpty ? _emptyPassConfirmField = true : _emptyPassConfirmField = false;
                  if (_emptyUsernameField == false && _emptyPassField == false && _emptyPassConfirmField == false){
                    _createAccountPressed ();
                  } else {
                    print('Empty email or password field on creating account');
                  }
                });
              }
            ),
            new FlatButton(
              child: new Text('Already have an account? Click here to login.',
                  style: TextStyle(color: Colors.white)),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }
  void _loginPressed () {
    //to add pass login information to authenticate user
    print('Login');
    print('Logging in with username: $_username and password: $_password');
    /*Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage())
    );*/
    requestLoginAPI(context, _username, _password);
  }

  void _createAccountPressed () {
    //to add pass account creation information the backend server
    //navigation to full registration page with all user details required if email has not been used
    //check if email has been used
    print('Creeat Account');
    print('Creating account with username: $_username and password: $_password');
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegistrationPage())
    );
  }

  void _passwordReset () {
    //to add navigation to new page where user will enter their email to reset password
    print('Password reset');
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PassResetPage())
    );
  }
}


enum FormType { //To determine whether the user is on login or register mode
  login,
  register
}
