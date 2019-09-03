import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ntupartner/ui/login.dart';
import 'package:ntupartner/ui/mainpage.dart';

import 'package:ntupartner/model/user_model.dart';

import 'package:ntupartner/common/functions/showDialogWithSingleButton.dart';
import 'package:ntupartner/common/api_functions/callRelogin.dart';

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
    await _testInternetConnection();
    //_testWebServerConnection();   //Use this when dns to web server is available
    await _testServerConnection();

    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = (preferences.getString('LastToken'));
    if (token == '' || token == null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      requestReloginAPI(context, token);
    }
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

  Future <void> _testInternetConnection () async {
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
      //wait new Future.delayed(const Duration(seconds: 3));
      //exit(0);  //Close app
    }
  }

  Future<void> _testWebServerConnection () async {  //Use this when website has a domain name
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
      //await new Future.delayed(const Duration(seconds: 3));
      //exit(0);  //Close app
    }
  }
  Future <void> _testServerConnection() async {  //for now use this to check connection
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