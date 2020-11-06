import 'package:flutter/material.dart';
import './RoomAdminMenu.dart';

class AddRoom1 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _roomName = '';
  String _maxTemp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新規部屋追加'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 30.0, bottom: 10.0, left: 30.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "部屋名", // ラベル
                  hintText: '部屋名を入力', // 入力ヒント
                ),
                autovalidate: false, // 入力変化しても自動でチェックしない。trueにすると初期状態および入力が変化する毎に自動でvalidatorがコールされる
                validator: (value) { // _formKey.currentState.validate()でコールされる
                  if (value.isEmpty) {
                    return '入力してください'; // エラー表示のメッセージを返す
                  }
                  return null; // 問題ない場合はnullを返す
                },
                onSaved: (value) => () { // this._formKey.currentState.save()でコールされる
                  _roomName = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 30.0, bottom: 10.0, left: 30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "体温上限", // ラベル
                  hintText: '体温上限を入力', // 入力ヒント
                ),
                autovalidate: false, // 入力変化しても自動でチェックしない。trueにすると初期状態および入力が変化する毎に自動でvalidatorがコールされる
                validator: (value) { // _formKey.currentState.validate()でコールされる
                  if (value.isEmpty) {
                    return '入力してください'; // エラー表示のメッセージを返す
                  }
                  return null; // 問題ない場合はnullを返す
                },
                onSaved: (value) => () { // this._formKey.currentState.save()でコールされる
                  _maxTemp = value;
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () {
                  // 各Fieldのvalidatorを呼び出す
                  if (_formKey.currentState.validate()) {
                    // 入力データが正常な場合の処理
                    this._formKey.currentState.save();
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddRoom2()));
                  }
                },
                child: Text('次へ'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class AddRoom2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新規部屋追加'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('ICカードリーダ登録')),
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
          Card(
            child: ListTile(
              title: Text('Enter Device ID 1'),
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
