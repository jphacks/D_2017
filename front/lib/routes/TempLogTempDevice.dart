import 'package:flutter/material.dart';

class TempLogTempDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Device 1 Data'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('User Device 1')),
          ListTile(
            title: Text('2020/11/01 12:00'),
            subtitle: Text('36.5℃'),
          ),
          ListTile(
            title: Text('2020/11/01 12:00'),
            subtitle: Text('36.5℃'),
          ),
          ListTile(
            title: Text('2020/11/01 12:00'),
            subtitle: Text('36.5℃'),
          ),
          ListTile(
            title: Text('2020/11/01 12:00'),
            subtitle: Text('36.5℃'),
          ),
          ListTile(
            title: Text('2020/11/01 12:00'),
            subtitle: Text('36.5℃'),
          ),

        ],
      )

      
    );
  }
}
