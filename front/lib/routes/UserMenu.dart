import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import './RoomAdminMenu.dart';
import './EnterRoomList.dart';
import './TempLog.dart';
import './AccountMenu.dart';

class UserMenu extends StatelessWidget {
  final CognitoUserSession _session;

  UserMenu(this._session);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('メニュー'),
        automaticallyImplyLeading: false
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('ユーザメニュー')),
          Card(
            child: ListTile(
              title: Text('入室申請一覧'),
              subtitle: Text('入室申請をした部屋の一覧を確認できます'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnterRoomList())
                )
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('検温ログ'),
              subtitle: Text('検温のログを表示'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TempLog(_session))
                )
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('アカウント情報設定'),
              subtitle: Text('アカウント情報を設定'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountMenu(_session))
                )
              },
            ),
          ),


          ListTile(title: Text('管理者メニュー')),
          Card(
            child: ListTile(
              title: Text('部屋管理メニュー'),
              subtitle: Text('部屋を管理します'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAdminMenu())
                )
              },
            ),
          ),
        ],
      )


    );
  }
}
