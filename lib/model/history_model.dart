import 'dart:async';
// History message will look like <<userName1>> <<interaction>> <<userName2>> with timestamp below

class HistoryModel {
  final String username1;
  final String username2;
  final String interaction;
  final String timestamp;

  HistoryModel(this.username1, this.username2, this.interaction, this.timestamp);

  HistoryModel.fromJson(Map<String, dynamic> json)  //change the json reference accordingly when done on server side
    : username1 = json['username1'],
      username2 = json['username2'],
      interaction = json['interaction'],
      timestamp = json['timestamp'];

  Map<String, dynamic> toJson() =>
      {
        'username1' : username1,
        'username2' : username2,
        'interaction' : interaction,
        'timestamp' : timestamp,
      };

  HistoryModel.fromMap(Map<String, dynamic> map) :
        username1 = map['username1'],
        username2 = map['username2'],
        interaction = map['interaction'],
        timestamp = map['timestamp'];



}

