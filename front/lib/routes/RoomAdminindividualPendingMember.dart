import 'package:flutter/material.dart';
import 'RoomAdminindividualPendingSelect.dart';

class RoomAdminindividualPendingMember extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => RoomAdminindividualPendingSelect()),
                )
              },
          ),
        ],
      )
    );
  }
}
