import 'package:flutter/material.dart';
import 'UserMenu.dart';
import '../main.dart';

class Signup extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新規ユーザ登録'),
        automaticallyImplyLeading: false
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
                  icon: Icon(Icons.verified_user_sharp),
                  labelText: "名前", // ラベル
                  hintText: 'User Name', // 入力ヒント
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
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 30.0, bottom: 10.0, left: 30.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: "メールアドレスを入力", // ラベル
                  hintText: 'Mail Address', // 入力ヒント
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
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 30.0, bottom: 10.0, left: 30.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "パスワードを入力", // ラベル
                  hintText: 'Password', // 入力ヒント
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
                  if (_formKey.currentState.validate()) {
                    // 入力データが正常な場合の処理
                    this._formKey.currentState.save();
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserMenu()));
                  }
                },
                child: Text('送信'),
              ),
            ),
            Padding(padding: EdgeInsets.all(20.0)),
            Align(
              alignment: Alignment.center,
              child: Text(
              'ログインはこちら',
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => App()));
                },
                child: Text(
                  "ログインページへ",
                ),
              ),
            )
            ],
        ),
      ),
    );
  }
}
