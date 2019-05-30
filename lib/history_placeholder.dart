import 'package:flutter/material.dart';

class PlaceholderHistory extends StatefulWidget {
  @override
  _PlaceholderHistoryState createState() => _PlaceholderHistoryState();
}


class _PlaceholderHistoryState extends State<PlaceholderHistory> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Center(
            child: Text('No History Found')
        )
    );
  }
}