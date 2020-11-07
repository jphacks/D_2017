import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import './UserMenu.dart';

class TempReqest extends StatelessWidget {
  final CognitoUserSession _session;
  final _tempKey = GlobalKey<FormState>();
  final _tempController = TextEditingController();

  TempReqest(this._session);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('体温手動登録'),
      ),
      body: Form(
        key: _tempKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 30.0, bottom: 10.0, left: 30.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "現在の体温を入力", // ラベル
                  hintText: '体温', // 入力ヒント
                ),
                validator: (value) { // _formKey.currentState.validate()でコールされる
                  if (value.isEmpty) {
                    return '入力してください'; // エラー表示のメッセージを返す
                  }
                  return null; // 問題ない場合はnullを返す
                },
                controller: _tempController,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () async {
                  // 各Fieldのvalidatorを呼び出す
                  if (_tempKey.currentState.validate()) {
                    var response = await http.post(DotEnv().env['API_BASE'] + '/temperature/body',
                    headers: {'Authorization': _session.getIdToken().getJwtToken()},
                    body: json.encode({
                      'body_temperature': double.parse(_tempController.text),
                      'mac_address': "FROM_APP",
                    }));
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
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserMenu(_session)));
                  }
                },
                child: Text('登録'),
              ),
            ),

          ],
        ),
      )
    );
  }
}
