import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RegICCard extends StatelessWidget {
  final CognitoUserSession _session;

  RegICCard(this._session);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ICカード登録'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('ICカード登録')),
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 30.0, bottom: 10.0, left: 30.0),
            child: Text(
              'カードをスマートフォンの上部に覆い隠すように置いてから、下の「スキャン」ボタンを押してください。'
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 30.0, bottom: 10.0, left: 30.0),
            child: Text(
              '【エラーが表示される場合】\n ・スキャンがうまくいかない場合は、ケースやカバーを外してください。'
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
              onPressed: () async {
                NfcData res = await FlutterNfcReader.read();
                print(res.id);

                var response = await http.post(DotEnv().env['API_BASE'] + '/card',
                  headers: {'Authorization': _session.getIdToken().getJwtToken()},
                  body: json.encode({'idm': res.id.replaceFirst('0x', '')}));

                if(response.statusCode == 201) {
                  await showDialog<int>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('登録に成功しました!'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('OK'),
                            onPressed: () => Navigator.of(context).pop(1),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  await showDialog<int>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('エラー'),
                        content: Text(response.body),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('OK'),
                            onPressed: () => Navigator.of(context).pop(1),
                          ),
                        ],
                      );
                    },
                  );
                }

                Navigator.pop(context);
              },
              child: Text(
                "スキャン",
              ),
            ),
          )
        ],
      )


    );
  }
}
