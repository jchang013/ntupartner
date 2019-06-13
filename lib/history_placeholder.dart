import 'package:flutter/material.dart';
import 'model/history_model.dart';

class PlaceholderHistory extends StatefulWidget {
  @override
  _PlaceholderHistoryState createState() => _PlaceholderHistoryState();
}


class _PlaceholderHistoryState extends State<PlaceholderHistory> {
  static int numOfMatch = sampleHistoryList.length; //change this to other list when fetched data from django

  @override
  Widget build(BuildContext context) {
    if (numOfMatch == 0) {
      return new Container(
          child: Center(
              child: Text('No History Found')
          )
      );
    } else {
      return HistoryList(sampleHistoryList);
    }
  }
}

class _HistoryListItem extends ListTile {
  _HistoryListItem(HistoryModel history) :
      super (
        title: Text('${history.username1} ${history.interaction} ${history.username2}'),
        subtitle: Text('${history.timestamp}'),
        leading: Icon(
          Icons.person
          )
        );

}

class HistoryList extends StatelessWidget {

  final List<HistoryModel> _histories;

  HistoryList(this._histories);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _buildHistoryList()
    );
  }

  List<_HistoryListItem> _buildHistoryList() {
    return _histories.map((history) => _HistoryListItem(history))
        .toList();
  }

}

final sampleHistoryList = <HistoryModel> [
  HistoryModel(
      'You',
      'Testname',
      'Liked',
      'dd/mm/yyyy'
  ),
  HistoryModel(
      'Testname2',
      'You',
      'Liked',
      'dd/mm/yyyy'
  ),
  HistoryModel(
      'You',
      'Testname3',
      'Passed',
      'dd/mm/yyyy'
  ),
  HistoryModel(
      'You',
      'Testname4',
      'Liked',
      'dd/mm/yyyy'
  ),
  HistoryModel(
      'You',
      'Testname5',
      'Liked',
      'dd/mm/yyyy'
  ),
  HistoryModel(
      'You',
      'Testname6',
      'Liked',
      'dd/mm/yyyy'
  ),
  HistoryModel(
      'Testname7',
      'You',
      'Liked',
      'dd/mm/yyyy'
  ),
  HistoryModel(
      'You',
      'Testname8',
      'Liked',
      'dd/mm/yyyy'
  ),
  HistoryModel(
      'You',
      'Testname9',
      'Liked',
      'dd/mm/yyyy'
  ),
  HistoryModel(
      'You',
      'Testname10',
      'Liked',
      'dd/mm/yyyy'
  ),
  HistoryModel(
      'Testname11',
      'You',
      'Liked',
      'dd/mm/yyyy'
  ),


];