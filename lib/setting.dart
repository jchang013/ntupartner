import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _SettingPageState();
  }
}


class _SettingPageState extends State<SettingPage> {
  bool receiveMatch = true;
  bool receiveNotification = true;

  void _onMatchChanged(bool value) {
    receiveMatch = false;
    print('Stopped receiving matches');
  }

  void _onNotificationChanged(bool value) {
    receiveNotification = false;
    print('Stopped receiving notification');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Settings"),
          ),
        body: Column(

          children: <Widget>[
            Row(
              children: [
                Text('\n')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Receive New Matches?', style: TextStyle(fontSize: 20),),

                Switch(
                  onChanged: _onMatchChanged,
                  value: receiveMatch,
                    ),
                  ]
                ),
            Row(
              children: [
                Text('\n')
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Receive Notification?', style: TextStyle(fontSize: 20),),

                  Switch(
                    onChanged: _onNotificationChanged,
                    value: receiveMatch,
                  ),
                ]
              ),
            ]
          )
        ),
      );
  }
}
