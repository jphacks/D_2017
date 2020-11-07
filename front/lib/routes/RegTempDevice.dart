import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import './AccountMenu.dart';

class RegTempDevice extends StatefulWidget {
  final CognitoUserSession _session;

  RegTempDevice(this._session);

  @override
  _RegTempDeviceState createState() => _RegTempDeviceState(_session);
}

class _RegTempDeviceState extends State<RegTempDevice> {
  final CognitoUserSession _session;

  List<ScanResult> deviceList;

  _RegTempDeviceState(this._session);

  @override
  void initState() {
    super.initState();
    _scan();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgets = [];

    if(deviceList == null) {
      deviceList = [];
    }
    for(var result in deviceList) {
      _widgets.add(Card(
        child: ListTile(
          title: Text(result.device.name),
          trailing: Icon(Icons.arrow_right),
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountMenu(_session))
            )
          },
        ),
      ));
    }

    var base = <Widget>[
      ListTile(title: Text('検温デバイス設定')),
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
      ListTile(title: Text('検出した検温デバイス一覧')),
    ];

    base.addAll(_widgets);

    return Scaffold(
      appBar: AppBar(
        title: Text('検温デバイス設定'),
      ),
      body: ListView(
        children: base,
      )
    );
  }

  _scan() {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    // Listen to scan results
    flutterBlue.scanResults.listen((results) {
        // do something with scan results
        for (ScanResult r in results) {
            print('${r.device.name} found! rssi: ${r.rssi}');
        }
        // deviceList = results;
    });

    // Stop scanning
    flutterBlue.stopScan();
    print('Scan stoped.');
  }
}
