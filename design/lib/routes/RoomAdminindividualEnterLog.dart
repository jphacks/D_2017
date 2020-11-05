import 'package:flutter/material.dart';

class RoomAdminindividualEnterLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('入退室状況'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('入室状態メンバー')),
          ListTile(
            title: Text('User Name A'),
          ),
          ListTile(
            title: Text('User Name B'),
          ),
          ListTile(
            title: Text('User Name C'),
          ),
          ListTile(
            title: Text('User Name D'),
          ),
          ListTile(title: Text('入退室ログ')),
          ListTile(
            title: Text('User Name 1'),
            subtitle: Text('入室: 2020/11/01 12:00'),
          ),
          ListTile(
            title: Text('User Name 1'),
            subtitle: Text('入室: 2020/11/01 12:00'),
          ),
          ListTile(
            title: Text('User Name 1'),
            subtitle: Text('入室: 2020/11/01 12:00'),
          ),
          ListTile(
            title: Text('User Name 1'),
            subtitle: Text('入室: 2020/11/01 12:00'),
          ),
          ListTile(
            title: Text('User Name 1'),
            subtitle: Text('入室: 2020/11/01 12:00'),
          ),
          ListTile(
            title: Text('User Name 1'),
            subtitle: Text('入室: 2020/11/01 12:00'),
          ),
        ],
      )
    );
  }
}
