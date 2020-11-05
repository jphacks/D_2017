import 'package:flutter/material.dart';
import './RoomAdminindividualDenyMember.dart';

class RoomAdminindividualDenySelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('保留メンバー'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('User Name O')),
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
                      builder: (context) => RoomAdminindividualDenyMember()));
              },
              child: Text(
                "入室を許可",
              ),
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
                      builder: (context) => RoomAdminindividualDenyMember()));
              },
              child: Text(
                "入室を拒否",
              ),
            ),
          )
        ],
      )
    );
  }
}
