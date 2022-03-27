import 'package:flutter/material.dart';
import 'package:softonauts_assignment/signinpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static const String _title = 'Softonauts';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme:ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: SignInPage(),

    );
  }
}