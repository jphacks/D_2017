import 'package:flutter/material.dart';
import './RoomAdminindividualDenySelect.dart';

class RoomAdminindividualDenyMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('保留メンバー'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('保留メンバー')),
          ListTile(
            title: Text('User Name O'),
            trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminindividualDenySelect()),
                )
              },
          ),
          ListTile(
            title: Text('User Name P'),
            trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminindividualDenySelect()),
                )
              },
          ),
          ListTile(
            title: Text('User Name Q'),
            trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminindividualDenySelect()),
                )
              },
          ),
          ListTile(
            title: Text('User Name R'),
            trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminindividualDenySelect()),
                )
              },
          ),
          ListTile(
            title: Text('User Name S'),
            trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminindividualDenySelect()),
                )
              },
          ),
          ListTile(
            title: Text('User Name T'),
            trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminindividualDenySelect()),
                )
              },
          ),
        ],
      )
    );
  }
}
