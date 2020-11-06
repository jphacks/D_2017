import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../UserMenu.dart';
import 'Signup.dart';

final userPool = new CognitoUserPool(
  DotEnv().env['POOL_ID'], DotEnv().env['CLIENT_ID']);

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _mailAddressController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
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
              controller: _mailAddressController, // 入力変化しても自動でチェックしない。trueにすると初期状態および入力が変化する毎に自動でvalidatorがコールされる
              validator: (value) { // _formKey.currentState.validate()でコールされる
                if (value.isEmpty) {
                  return '入力してください'; // エラー表示のメッセージを返す
                }
                if (!EmailValidator.validate(value)) {
                  return '正しいメールアドレスを入力してください';
                }
                return null; // 問題ない場合はnullを返す
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
              controller: _passwordController,
              validator: (value) { // _formKey.currentState.validate()でコールされる
                if (value.isEmpty) {
                  return '入力してください'; // エラー表示のメッセージを返す
                }
                if (value.length < 8) {
                  return '8文字以上のパスワード入力してください';
                }
                return null; // 問題ない場合はnullを返す
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () {
                // 各Fieldのvalidatorを呼び出す
                if (_formKey.currentState.validate()) {
                  _signIn(context);
                }
              },
              child: Text('ログイン'),
            ),
          ),
          Padding(padding: EdgeInsets.all(20.0)),
          Align(
            alignment: Alignment.center,
            child: Text(
              '登録がお済みでない方',
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
                      builder: (context) => Signup()));
              },
              child: Text(
                "アカウント登録はこちら",
              ),
            ),
          )
        ],
      ),
    );
  }

  void _signIn(BuildContext context) async {
    var cognitoUser = new CognitoUser(_mailAddressController.text, userPool);
    var authDetails = new AuthenticationDetails(
        username: _mailAddressController.text,
        password: _passwordController.text);
    try {
      var session = await cognitoUser.authenticateUser(authDetails);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserMenu(session))
      );
    } catch (e) {
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
