import 'package:flutter/material.dart';
import 'package:squish_app/pages/login_page.dart';
import 'package:squish_app/pages/landing_page.dart';
import 'package:squish_app/pages/signup_page.dart';
import 'package:squish_app/pages/forgot_pw_page.dart';
import 'package:squish_app/pages/profile_page.dart';
import 'package:squish_app/pages/getting_started_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes : <String,WidgetBuilder>{
        '/login' : (context) => LoginPage(),
        '/signup' : (context) => SignupPage(),
        '/forget' : (context) => ForgotPwPage(),
        '/profile' : (context) => ProfilePage(),
        '/gettingstarted' : (context) => GettingStartedPage(),
      },
      title : 'Squish',
      theme : ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: LandingPage(),
    );
  }
}