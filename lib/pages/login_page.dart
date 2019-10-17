import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:squish_app/pages/home.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  String _email, _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title: Text('Log in'),
      ),
      body: Form(
        key : _formKey,
        child: Column (
          children: <Widget>[
            TextFormField(
              validator: (input) => input.isEmpty ? 'Email can\'t be empty' : null,
              onSaved : (input) => _email = input,
              decoration : InputDecoration(
                labelText : "Email",
              ),
            ),
            TextFormField(
              validator: (input) => input.length < 6 ? 'Please enter valid password' : null,
              onSaved : (input) => _password = input,
              decoration : InputDecoration(
                labelText : "Password",
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed : signIn,
              child : Text('Log in'),
            ),
            FlatButton(
              child : Text('Create an account', style : new TextStyle(fontSize :20.0)),
              onPressed: (){
                Navigator.pushNamed(context,'/signup');
              }
            )
          ]
        ),
      ),
    );
  }
  Future<void> signIn() async {
    //Todo validate fields
    //Todo Login to firebase
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email : _email,password : _password);
        Navigator.push(context,MaterialPageRoute(builder:(context)=> Home()));
      }catch(e){
        print(e.message);
      }
    }
  }
}