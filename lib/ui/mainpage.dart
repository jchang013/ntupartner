import 'package:flutter/material.dart';
import 'package:ntupartner/ui/match_placeholder.dart';
import 'package:ntupartner/ui/history_placeholder.dart';
import 'package:ntupartner/ui/login.dart';
import 'package:ntupartner/ui/setting.dart';
import 'package:ntupartner/ui/profile.dart';
//import 'package:flutter/help.dart';
//import 'package:flutter/login.dart';


class MainPage extends StatefulWidget {
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
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderUser(),
    PlaceholderHistory()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Main'),
        automaticallyImplyLeading: false,
        leading:
          new IconButton(
            icon: new Image.asset('assets/default_user_img.png'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
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
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
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
