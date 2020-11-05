import 'package:flutter/material.dart';

class RoomAdminindividualAllowMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('承認済みメンバー'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('承認済みメンバー')),
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
          ListTile(
            title: Text('User Name E'),
          ),
          ListTile(
            title: Text('User Name F'),
          ),
        ],
      )
    );
  }
}
