import 'package:flutter/material.dart';
import 'package:squish_app/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title : 'Squish_Auth',
      theme : ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: LoginPage(),
    );
  }
}