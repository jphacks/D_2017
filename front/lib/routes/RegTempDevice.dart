import 'package:flutter/material.dart';
import './AccountMenu.dart';

class RegTempDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('検温デバイス設定'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('検温デバイス設定')),
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 30.0, bottom: 10.0, left: 30.0),
            child: Text(
             '下に表示されるリストの中から、登録するデバイスを選択してください。'
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 30.0, bottom: 10.0, left: 30.0),
            child: Text(
             '表示されない場合は、以下の2点をご確認ください。\n ・機器の電源が入っているか\n ・スマートフォンと機器を近づけているか'
            ),
          ),
          ListTile(title: Text('検出した検温デバイス一覧')),
          Card(
            child: ListTile(
              title: Text('MAKURA Device'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountMenu())
                )
              },
            ),
          ),

          Card(
            child: ListTile(
              title: Text('Toilet Device'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountMenu())
                )
              },
            ),
          ),
        ],
      )

      
    );
  }
}
