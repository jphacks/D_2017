import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import './UserMenu.dart';

class TempReqest extends StatelessWidget {
  final CognitoUserSession _session;
  final _tempKey = GlobalKey<FormState>();
  String _nowTemp = '';

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
                autovalidate: false, // 入力変化しても自動でチェックしない。trueにすると初期状態および入力が変化する毎に自動でvalidatorがコールされる
                validator: (value) { // _formKey.currentState.validate()でコールされる
                  if (value.isEmpty) {
                    return '入力してください'; // エラー表示のメッセージを返す
                  }
                  return null; // 問題ない場合はnullを返す
                },
                onSaved: (value) => () { // this._formKey.currentState.save()でコールされる
                  _nowTemp = value;
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () {
                  // 各Fieldのvalidatorを呼び出す
                  if (_tempKey.currentState.validate()) {
                    // 入力データが正常な場合の処理
                    this._tempKey.currentState.save();
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
