import 'package:flutter/material.dart';
import 'UserMenu.dart';
import '../main.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

/* ここ変更してね */
final userPool = new CognitoUserPool('[プールID ex. ap-northeast-1_XXXXXXXX]', '[アプリクライアントID]');

class Signup extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _mailAddressController = TextEditingController();
  final _passwordController = TextEditingController();

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
                controller: _mailAddressController,
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
                controller: _passwordController,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () {
                  // 各Fieldのvalidatorを呼び出す
                  if (_formKey.currentState.validate()) {
                    _signUp(context);
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

  void _signUp(BuildContext context) async {
    try {
      CognitoUserPoolData userPoolData = await userPool.signUp(
          _mailAddressController.text, _passwordController.text);
      Navigator.push(
        context,
        new MaterialPageRoute<Null>(
          settings: const RouteSettings(name: "/ConfirmRegistration"),
          builder: (BuildContext context) => ConfirmRegistration(userPoolData),
        ),
      );
    } on CognitoClientException catch (e) {
      await showDialog<int>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('エラー'),
            content: Text(e.message),
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
  }
}

class ConfirmRegistration extends StatelessWidget {
  final _registrationController = TextEditingController();
  final CognitoUserPoolData _userPoolData;

  ConfirmRegistration(this._userPoolData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('レジストレーションキー確認'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_userPoolData.user.username),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'レジストレーションコード',
                    labelText: 'レジストレーションコード',
                  ),
                  obscureText: true,
                  controller: _registrationController,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 8.0),
                child: RaisedButton(
                  child: Text('確認'),
                  color: Colors.indigo,
                  shape: StadiumBorder(),
                  textColor: Colors.white,
                  onPressed: () => _confirmRegistration(context),
                ),
              ),
            ]),
      ),
    );
  }

  void _confirmRegistration(BuildContext context) async {
    try {
      await _userPoolData.user
          .confirmRegistration(_registrationController.text);
      await showDialog<int>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('登録完了'),
            content: Text('ユーザーの登録が完了しました。'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () =>
                    Navigator.of(context).popUntil(ModalRoute.withName('/')),
              ),
            ],
        );
        },
      );
    } on CognitoClientException catch (e) {
      await showDialog<int>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('エラー'),
            content: Text(e.message),
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
  }
}