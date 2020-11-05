import 'package:flutter/material.dart';
import './RoomAdminindividualEnterLog.dart';
import './RoomAdminindividualEditName.dart';
import './RoomAdminindividualEditTemp.dart';
import './RoomAdminindividualAllowMember.dart';
import './RoomAdminindividualDenyMember.dart';

class RoomAdminindividual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room 1'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('部屋名')),
          Card(
            child: ListTile(
              title: Text('Room 1'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminindividualEditName())
                )
              },
            ),
          ),
            
          ListTile(title: Text('体温上限')),
          Card(
            child: ListTile(
              title: Text('37.5℃'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminindividualEditTemp())
                )
              },
            ),
          ),

          ListTile(title: Text('入退室状況')),
          Card(
            child: ListTile(
              title: Text('現在5人入室状態'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminindividualEnterLog())
                )
              },
            ),
          ),

          ListTile(title: Text('承認済みメンバー')),
          Card(
            child: ListTile(
              title: Text('16人承認済み'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminindividualAllowMember())
                )
              },
            ),
          ),

          ListTile(title: Text('保留メンバー')),
          Card(
            child: ListTile(
              title: Text('8人の保留メンバー'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminindividualDenyMember())
                )
              },
            ),
          ),
        ],
      )
    );
  }
}
