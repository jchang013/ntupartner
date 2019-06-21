import 'package:flutter/material.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:ntupartner/ui/login.dart';

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
    _testWebServerConnection();
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
      await new Future.delayed(const Duration(seconds: 3));
      exit(0);  //Close app
    }
  }

  void _testWebServerConnection () async {
    try {
      final result = await InternetAddress.lookup('172.21.148.187');  //change to web server when up
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Fluttertoast.showToast(
          msg: "Connected",
        );
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg: "Server might be down or under maintanence, please try again later",
        toastLength: Toast.LENGTH_LONG,
      );
      await new Future.delayed(const Duration(seconds: 3));
      //exit(0);  //Close app
    }
  }
}