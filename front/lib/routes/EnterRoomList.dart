import 'package:flutter/material.dart';

class EnterRoomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('申請一覧'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('承認済み申請一覧')),
          Card(
            child: ListTile(
              title: Text('Room 1'),
            ),
          ),

          ListTile(title: Text('未承認申請一覧')),
          Card(
            child: ListTile(
              title: Text('Room 4'),
            ),
          ),
        ],
      )
    );
  }
}
