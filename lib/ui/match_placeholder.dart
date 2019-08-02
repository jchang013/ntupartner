import 'package:flutter/material.dart';

class PlaceholderUser extends StatefulWidget {
  @override
  _PlaceholderUserState createState() => _PlaceholderUserState();
}

class _PlaceholderUserState extends State<PlaceholderUser> {
  static int numOfMatch = 1;

  @override
  Widget build(BuildContext context) {
    //To add if else statement to control when there is a daily match or not
    if (numOfMatch > 0) {
        return new ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            new Image(
                alignment: Alignment(0.0, -0.95),
                image: new AssetImage('assets/default_user_img.png')
            ),
            new Divider(height: 18.0,color: Colors.transparent,),
            new Align(
              alignment: Alignment.centerLeft,
              child: Text('<<Name>>, <<Age>>', style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            new Divider(height: 18.0,color: Colors.transparent,),
            new Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description', style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            new Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '<<User Description>>', style: new TextStyle(fontSize: 16,),),
            ),
            new Divider(height: 18.0,color: Colors.transparent,),
            new Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hobbies', style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            new Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '<<User Hobbies>>', style: new TextStyle(fontSize: 16,),),
            ),
            new Divider(height: 18.0,color: Colors.transparent,),
            new Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Country of Origin', style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            new Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '<<User Country of Origin>>', style: new TextStyle(fontSize: 16,),),
            ),
            new Divider(height: 18.0,color: Colors.transparent,),
            new Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Religion', style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            new Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '<<User Religion>>', style: new TextStyle(fontSize: 16,),),
            ),
            new Divider(height: 18.0,color: Colors.transparent,),
            new Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Course of Study', style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            new Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '<<User Course of Study>>, <<Year of Matriculation>>', style: new TextStyle(fontSize: 16,),),
            ),
            new Divider(height: 18.0,color: Colors.transparent,),

            new Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RawMaterialButton(
                    onPressed: () {},
                    child: new Icon(
                        Icons.favorite,
                        color: Colors.red,
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.white,
                    padding: const EdgeInsets.all(15.0),
                  ),
                new RawMaterialButton(
                  onPressed: () {},
                  child: new Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(15.0),
                ),
              ],
            ),
          ],
        );
    }
    else {
      return new Container(
          child: Center(
              child: Text('No more match for today, please come back again tomorrow.')
          )
      );
    }
  }
}
