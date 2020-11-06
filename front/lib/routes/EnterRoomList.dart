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
          Card(
            child: ListTile(
              title: Text('Room 2'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Room 3'),
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
