import 'package:flutter/material.dart';
import './TempLogTempDevice.dart';
import './TempReqest.dart';

class TempLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('検温ログ'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('検温ログ')),

          ListTile(title: Text('機器別検温データ')),
          Card(
            child: ListTile(
              title: Text('User Device 1'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TempLogTempDevice())
                )
              },
            ),
            
          ),
          Card(
            child: ListTile(
              title: Text('User Device 2'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TempLogTempDevice())
                )
              },
            ),
          ),


          
          ListTile(title: Text('体温手動登録')),
          Card(
            child: ListTile(
              title: Text('体温手動登録'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TempReqest())
                )
              },
            ),
          ),
        ],
      )

      
    );
  }
}
