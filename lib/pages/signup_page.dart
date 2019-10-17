import 'package:flutter/material.dart';
import 'package:squish_app/common/inputTextContainer.dart';

class SignupPage extends StatefulWidget{
  @override
  _SignupPage createState() => new _SignupPage();
}

class _SignupPage extends State<SignupPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body : Container(
        child : Column (
          children: <Widget>[
            //navbar here
            Container(
              child : Padding(
                padding : EdgeInsets.all(32),
                child : Wrap(
                  runSpacing :20,
                  children : <Widget>[
                      buildTextForm("First Name", null),
                      buildTextForm("Last Name", null),
                      buildTextForm("Email Address", Icons.email),
                      buildTextForm("Password", Icons.person),
                  ]
                )
              )
            )
          ],
        )
      )
    );
  }
}