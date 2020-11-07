import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../main.dart';
import 'ConfirmRegistration.dart';

final userPool = new CognitoUserPool(DotEnv().env['POOL_ID'], DotEnv().env['CLIENT_ID']);

class Signup extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _userIdController = TextEditingController();
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
                  icon: Icon(Icons.people),
                  labelText: "ユーザIDを入力", // ラベル
                  hintText: 'User ID', // 入力ヒント
                ),
                validator: (value) { // _formKey.currentState.validate()でコールされる
                  if (value.isEmpty) {
                    return '入力してください'; // エラー表示のメッセージを返す
                  }
                  return null; // 問題ない場合はnullを返す
                },
                controller: _userIdController,
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
                validator: (value) { // _formKey.currentState.validate()でコールされる
                  if (value.isEmpty) {
                    return '入力してください'; // エラー表示のメッセージを返す
                  }
                  if (!EmailValidator.validate(value)) {
                  return '正しいメールアドレスを入力してください';
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
                validator: (value) { // _formKey.currentState.validate()でコールされる
                  if (value.isEmpty) {
                    return '入力してください'; // エラー表示のメッセージを返す
                  }
                  if (value.length < 8) {
                  return '8文字以上のパスワード入力してください';
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
                  Navigator.pop(
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
      final List<AttributeArg> attributes = [];
      attributes.add(new AttributeArg(name: 'email', value: _mailAddressController.text));
      CognitoUserPoolData userPoolData = await userPool.signUp(
          _userIdController.text, _passwordController.text, userAttributes: attributes);
      Navigator.push(
        context,
        new MaterialPageRoute(
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
