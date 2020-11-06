import 'package:flutter/material.dart';
import './AccountMenu.dart';

class RegICCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ICカード登録'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('ICカード登録')),
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 30.0, bottom: 10.0, left: 30.0),
            child: Text(
             'カードをスマートフォンの上部に覆い隠すように置いてから、下の「スキャン」ボタンを押してください。'
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 30.0, bottom: 10.0, left: 30.0),
            child: Text(
             '【エラーが表示される場合】\n ・スキャンがうまくいかない場合は、ケースやカバーを外してください。'
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountMenu()));
              },
              child: Text(
                "スキャン",
              ),
            ),
          )
        ],
      )

      
    );
  }
}
