import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgotPwPage extends StatefulWidget{
  @override
  _ForgotPwPageState createState() => _ForgotPwPageState();
}

class _ForgotPwPageState extends State<ForgotPwPage> {

  String numberState = '';

  Widget _buildContainer(BuildContext context){
    return Container(
      child : Column(children: <Widget>[
        Text("Forgot Password?"),
        Text("Enter your phone number below and we'll send you a reset code"),
        new TextField(
          decoration: new InputDecoration(labelText: "Enter your number"),
          keyboardType: TextInputType.number,
          onChanged: (num) => setState(() => numberState = num),
        ),
        RaisedButton(
          onPressed : (){_handleSubmit();},
          child: Text('Send Reset Link'),
        )
      ],)
    );
  }

  _handleSubmit(){
    //Whenever we're ready to handle the submit, we do it here.
    if(numberState.length == 12){
      print(numberState);
    }else{
      print('Not a valid phone number!');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Column(
        children: <Widget>[
          _buildContainer(context),
        ],
      )
    );
  }
}