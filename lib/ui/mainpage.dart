import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:ntupartner/common/functions/saveLogout.dart';

import 'package:ntupartner/model/user_model.dart';
import 'package:ntupartner/model/match_model.dart';

import 'package:ntupartner/ui/match_placeholder.dart';
import 'package:ntupartner/ui/history_placeholder.dart';
import 'package:ntupartner/ui/login.dart';
import 'package:ntupartner/ui/setting.dart';
import 'package:ntupartner/ui/profile.dart';


class MainPage extends StatefulWidget {
  final UserModel user;
  final List<MatchModel> match;
  MainPage({Key key, this.user, this.match}) : super(key: key);
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class Menu{
  static const String Settings = 'Settings';
  static const String Help = 'Help';
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[
    Settings,
    Help,
    SignOut
  ];
}

class _MainPageState extends State<MainPage> {

  final Key keyOne = PageStorageKey('pageOne');
  final Key keyTwo = PageStorageKey('pageTwo');

  PlaceholderUser one;
  PlaceholderHistory two;
  List<Widget> pages;
  Widget currentPage;

  final PageStorageBucket bucket = PageStorageBucket();

  int _currentIndex = 0;
  int currentTab = 0;

  static String token;
  static int id;
  static String fullname;
  static bool interested_flag;
  static bool ban_flag;
  static String description;
  static String course_of_study;
  static String date_of_birth;
  static String gender;
  static int year_of_matriculation;
  static String religion;
  static String country_of_origin;
  static String hobbies;
  static String avatar_url;
  static File image;
  static String imageBytesInString;

  static String matchID;

  UserModel user;
  List<MatchModel> match = new List();

  @override
  void initState() {

    token = widget.user.token;
    id = widget.user.id;
    fullname = widget.user.fullname;
    interested_flag = widget.user.interested_flag;
    ban_flag = widget.user.ban_flag;
    description = widget.user.description;
    course_of_study = widget.user.course_of_study;
    date_of_birth = widget.user.date_of_birth;
    gender = widget.user.gender;
    year_of_matriculation = widget.user.year_of_matriculation;
    religion = widget.user.religion;
    country_of_origin = widget.user.country_of_origin;
    hobbies = widget.user.hobbies;
    avatar_url = widget.user.avatar_url;
    imageBytesInString = widget.user.imageBytesInString;
    user = new UserModel(token, id, fullname, interested_flag,
        ban_flag, description, course_of_study, date_of_birth,
        gender, year_of_matriculation, religion, country_of_origin,
        hobbies, avatar_url, imageBytesInString);

    for (var i = 0; i < widget.match.length; i++) {
      matchID = widget.match[i].matchID;
      MatchModel matching = new MatchModel(matchID);
      match.add(matching);
    }

    one = PlaceholderUser(
        key: keyOne,
        user: user,
        match: match
    );

    two = PlaceholderHistory(
        key: keyTwo
    );

    pages = [one, two];

    currentPage = one;

    super.initState();
  }

  //UserModel user = new UserModel(token, id, fullname, interested_flag,
     // ban_flag, description, course_of_study, date_of_birth,
    //  gender, year_of_matriculation, religion, country_of_origin,
     // hobbies, avatar_url, imageBytesInString);

  //final List<Widget> _children = [
   // PlaceholderUser(description: description),
    //PlaceholderHistory()
  //];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: PageStorage(bucket: bucket, child: currentPage),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: (int index) {
            setState(() {
              currentTab = index;
              currentPage = pages[index];
            });
          },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text('Daily Match'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.history),
            title: new Text('History'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void choiceAction(String choice){
    if(choice == Menu.Settings){
      print('Settings');
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingPage())
    );

    }else if(choice == Menu.Help){
      print('Help');
      
     // Navigator.push(
        //context,
        //MaterialPageRoute(builder: (context) => HelpPage())
    //);

    }else if(choice == Menu.SignOut){
      print('SignOut');
      _showSignOutDialog();
    }
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: Text('Main'),
      automaticallyImplyLeading: false,
      leading:
      new IconButton(
        icon: new Image.asset('assets/default_user_img.png'),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(user: widget.user)));
        },
      ),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: choiceAction,
          itemBuilder: (BuildContext context){
            return Menu.choices.map((String choice){
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        )
      ],
    );
  }
  
  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Sign Out"),
          content: new Text("Are you sure you want to sign out?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Sign Out"),
              onPressed: () {
                saveLogout();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false);
                  },
                ),
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
