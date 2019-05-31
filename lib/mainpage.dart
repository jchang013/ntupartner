import 'package:flutter/material.dart';
import 'match_placeholder.dart';
import 'history_placeholder.dart';
import 'login.dart';
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
          new IconButton(icon: new Image.asset('assets/default_user_img.png'),),
        actions: <Widget>[
          //new IconButton(icon: Icon(Icons.more_vert), onPressed: null)
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
      
      //Navigator.push(
        //context,
       // MaterialPageRoute(builder: (context) => SettingsPage())
    //);

    }else if(choice == Menu.Help){
      print('Help');
      
     // Navigator.push(
        //context,
        //MaterialPageRoute(builder: (context) => HelpPage())
    //);

    }else if(choice == Menu.SignOut){
      print('SignOut');
      //Sign out will bring to login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage())
      );
    }
  }
}
