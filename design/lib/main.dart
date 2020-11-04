import 'package:design/routes/Login.dart';
import 'package:flutter/material.dart';
import 'header.dart'; // <- header.dart を インポート

void main() {
 runApp(App());
}

class App extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
       appBar: Header(), // <- 新しく作った Header Widget (Header Instance) を指定 
       body: Login(),
     ),
   );
 }
}