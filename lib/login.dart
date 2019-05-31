import 'package:flutter/material.dart';
import 'mainpage.dart';
import 'passreset.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();

  String _email = "";
  String _password = "";

  FormType _form = FormType.login;

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      //to add alert user if empty field
    }
    else {
      //to add check if email is from NTU
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      //to add alert user if empty field
    }
    else {
      //to add password strength checker
      _password = _passwordFilter.text;
    }
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
                controller: _emailFilter,
                decoration: new InputDecoration(
                    labelText: 'Email',
                    labelStyle: new TextStyle(color: Colors.white)
                ),
              ),
            ),
            new Container(
              child: new TextField(
                controller: _passwordFilter,
                decoration: new InputDecoration(
                    labelText: 'Password',
                    labelStyle: new TextStyle(color: Colors.white)
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
                controller: _emailFilter,
                decoration: new InputDecoration(
                    labelText: 'Email',
                    labelStyle: new TextStyle(color: Colors.white)
                ),
              ),
            ),
            new Container(
              child: new TextField(
                controller: _passwordFilter,
                decoration: new InputDecoration(
                    labelText: 'Password',
                    labelStyle: new TextStyle(color: Colors.white)
                ),
                obscureText: true,
              ),
            ),
            new Container(
              child: new TextField(
                controller: _passwordFilter,
                decoration: new InputDecoration(
                    labelText: 'Comfirm Password',
                    labelStyle: new TextStyle(color: Colors.white)
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
              onPressed: _loginPressed,
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
              onPressed: _createAccountPressed,
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
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage())
    );
  }

  void _createAccountPressed () {
    //to add pass account creation information the backend server
    //navigation to full registration page with all user details required if email has not been used
    print('Creeat Account');
  }

  void _passwordReset () {
    //to add navigation to new page where user will enter their email to reset password
    print('Password reset');
  }
}


enum FormType { //To determine whether the user is on login or register mode
  login,
  register
}
