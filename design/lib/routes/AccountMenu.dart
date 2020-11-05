import 'package:design/main.dart';
import 'package:flutter/material.dart';
import './RegTempDevice.dart';
import './RegICCard.dart';

class AccountMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アカウント情報設定'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('アカウント情報設定')),
          Card(
            child: ListTile(
              title: Text('検温デバイス設定'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegTempDevice())
                )
              },
            ),
            
          ),
          Card(
            child: ListTile(
              title: Text('ICカード登録'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegICCard())
                )
              },
            ),
          ),

          Card(
            child: ListTile(
              title: Text('ログアウト'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => App())
                )
              },
            ),
          ),
        ],
      )

      
    );
  }
}
