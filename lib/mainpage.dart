import 'package:flutter/material.dart';
import 'match_placeholder.dart';
import 'package:ntupartner/history_placeholder.dart';

class MainPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
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
        automaticallyImplyLeading: false
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
}