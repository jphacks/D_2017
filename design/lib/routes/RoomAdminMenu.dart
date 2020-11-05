import 'package:flutter/material.dart';
import './RoomAdminindividual.dart';
import './AddRoom.dart';

class RoomAdminMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('部屋管理メニュー'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddRoom1())
              ),
          ),
        ]
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('部屋管理メニュー')),
          Card(
            child: ListTile(
              title: Text('Room 1'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminindividual())
                )
              },
            ),
            
          ),
          Card(
            child: ListTile(
              title: Text('Room 2'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminindividual())
                )
              },
            ),
          ),
        ],
      )
    );
  }
}
