import 'package:flutter/material.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ntupartner/ui/login.dart';
import 'package:ntupartner/ui/mainpage.dart';

import 'package:ntupartner/model/user_model.dart';

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

    return new Timer(Duration(seconds: 7), onDoneLoading);
  }

  onDoneLoading() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var fullname = (preferences.getString('LastUser'));
    if (fullname == '') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      String token = (preferences.getString('LastUser'));
      int id = (preferences.getInt('LastID'));
      bool interested_flag = (preferences.getBool('LastInterestedFlag'));
      bool ban_flag = (preferences.getBool('LastBanFlag'));
      String description = (preferences.getString('LastDescription'));
      String course_of_study = (preferences.getString('LastCourseOfStudy'));
      String date_of_birth = (preferences.getString('LastDateOfBirth'));
      String gender = (preferences.getString('LastGender'));
      int year_of_matriculation = (preferences.getInt('LastYearOfMatriculation'));
      String religion = (preferences.getString('LastReligion'));
      String country_of_origin = (preferences.getString('LastCountryOfOrigin'));
      String hobbies = (preferences.getString('LastHobbies'));
      String avatar_url = (preferences.getString('LastAvatarUrl'));

      var user = new UserModel(token, id, fullname, interested_flag, ban_flag,
      description, course_of_study, date_of_birth, gender, year_of_matriculation,
      religion, country_of_origin, hobbies, avatar_url);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainPage(user: user)));
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
      //wait new Future.delayed(const Duration(seconds: 3));
      //exit(0);  //Close app
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
      //await new Future.delayed(const Duration(seconds: 3));
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