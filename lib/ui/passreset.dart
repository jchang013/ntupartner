import 'package:flutter/material.dart';

class PassResetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PassResetPageState();
}

class _PassResetPageState extends State<PassResetPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  String _email = "";
  bool _emptyEmailField = false;

  _PassResetPageState() {
    _emailFilter.addListener(_emailListen);
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
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(
                  labelText: 'Email',
                  labelStyle: new TextStyle(color: Colors.white),
                  errorText: _emptyEmailField ? 'Field Can\'t Be Empty' : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text('Reset Password'),
            onPressed: () {
              setState(() {
                _emailFilter.text.isEmpty ? _emptyEmailField = true : _emptyEmailField = false;
                if (_emptyEmailField == false){
                  _passwordResetPressed ();
                } else {
                  print('Empty email field');
                }
              });
            }

          ),
        ],
      ),
    );
  }

  void _emailListen() {
    _email = _emailFilter.text;
  }

  void _passwordResetPressed () {

    print('Resetting password for $_email');
  }
}


