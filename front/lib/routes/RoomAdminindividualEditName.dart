import 'package:flutter/material.dart';
import 'RoomAdminindividual.dart';

class RoomAdminindividualEditName extends StatelessWidget {
  final _tempKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('部屋名編集'),
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
                  labelText: "部屋名を入力", // ラベル
                  hintText: '部屋名', // 入力ヒント
                ),
                autovalidate: false, // 入力変化しても自動でチェックしない。trueにすると初期状態および入力が変化する毎に自動でvalidatorがコールされる
                validator: (value) { // _formKey.currentState.validate()でコールされる
                  if (value.isEmpty) {
                    return '入力してください'; // エラー表示のメッセージを返す
                  }
                  return null; // 問題ない場合はnullを返す
                },
                onSaved: (value) => () { // this._formKey.currentState.save()でコールされる
                  print('$value');
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
                        builder: (context) => RoomAdminindividual()));
                  }
                },
                child: Text('更新'),
              ),
            ),

          ],
        ),
      )
    );
  }
}
