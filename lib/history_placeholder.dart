import 'package:flutter/material.dart';

class PlaceholderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //To add if else statement to control when there is a history or not, if there is history add in ListView
    return new Container(
      child: Center(
        child: Text('No History Found')
      )
    );
  }
}