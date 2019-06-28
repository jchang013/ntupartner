import 'package:flutter/material.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:ntupartner/ui/login.dart';
import 'package:ntupartner/common/functions/showDialogWithSingleButton.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    _testInternetConnection();
    //_testWebServerConnection();   //Use this when dns to web server is available
    _testServerConnection();

    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/SplashScreen_background.jpg"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black54,
        ),
        new Container(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                ),
              ),
             )
         ]),
    );

  }

  void _testInternetConnection () async {
    try {
      final result = await InternetAddress.lookup('google.com');  //change to web server when up
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //Fluttertoast.showToast(msg: "Connected",);
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: "Please ensure you have internet connection!",
          toastLength: Toast.LENGTH_LONG,
      );
      showDialogSingleButton(
          context,
          'No Internet Connection',
          'Please ensure you have internet connection for the application to work.',
          'Ok');
      await new Future.delayed(const Duration(seconds: 3));
      exit(0);  //Close app
    }
  }

  void _testWebServerConnection () async {  //Use this when website has a domain name
    try {
      final result = await InternetAddress.lookup('http://172.21.148.187:8000/accounts/login');  //change to web server when up
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Fluttertoast.showToast(
          msg: "Connected",
        );
      }
    } on SocketException catch (_) {
      showDialogSingleButton(
          context,
          'Unable to connect to server',
          'Server might be down or under maintanence, please try again later.',
          'Ok');
      await new Future.delayed(const Duration(seconds: 3));
      //exit(0);  //Close app
    }
  }
  void _testServerConnection() async {  //for now use this to check connection
    final response =
    await http.get('http://172.21.148.187:8000/accounts/login');

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "Connected",
      );
    } else {
      showDialogSingleButton( 
          context,
          'Unable to connect to server',
          'Server might be down or under maintanence, please try again later.',
          'Ok');
    }
  }
}