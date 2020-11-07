import 'package:flutter/material.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

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
