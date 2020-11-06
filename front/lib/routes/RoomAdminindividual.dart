import 'package:flutter/material.dart';
import './RoomAdminindividualEnterLog.dart';
import './RoomAdminindividualEditName.dart';
import './RoomAdminindividualEditTemp.dart';
import './RoomAdminindividualAllowMember.dart';
import './RoomAdminindividualDenyMember.dart';

class RoomAdminindividual extends StatelessWidget {
  String _roomName = '';
  String _maxTemp = '';
  int _roomNowMembers = 0;
  int _roomAllowMembers =0;
  int _roomPendingMembers = 0;

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
              title: Text(_roomName),
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
              title: Text(_maxTemp + '℃'),
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
              title: Text('現在' + _roomNowMembers.toString() +'人入室状態'),
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
              title: Text(_roomAllowMembers.toString() + '人承認済み'),
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
              title: Text(_roomPendingMembers.toString() + '人の保留メンバー'),
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
