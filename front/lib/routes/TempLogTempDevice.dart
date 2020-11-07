import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class TempLogTempDevice extends StatefulWidget {
  final CognitoUserSession _session;

  TempLogTempDevice(this._session);

  @override
  _TempLogState createState() => _TempLogState(_session);
}

class _TempLogState extends State<TempLogTempDevice> {
  final CognitoUserSession _session;

  List tempList;

  _TempLogState(this._session);

  @override
  void initState() {
    super.initState();
    _fetch();
    tempList = [];
  }

  @override
  Widget build(BuildContext context) {

      List<Widget> _widgets = [];

      print(tempList);
      if(tempList == null) {
        tempList = [];
      }

      for (var temp in tempList) {
        print(temp);
        _widgets.add(ListTile(
          title: Text(temp['measuredTime']),
          subtitle: Text(temp['temperature'].toString()),
        ));
      }
      return Scaffold(
        appBar: AppBar(
          title: Text('User Device 1 Data'),
        ),
        body: ListView(
          children: _widgets,
        )
      );
  }

  _fetch() async {
    var response = await http.get(DotEnv().env['API_BASE'] + '/temperature/body?offset=0&count=10',
      headers: {'Authorization': _session.getIdToken().getJwtToken()});

    print(response.statusCode);

    var data = jsonDecode(response.body);
    print(data);
    setState(() {
      tempList = data['Logs'];
    });
  }
}
