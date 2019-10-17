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
        title: Text('Sign In'),
      ),
      body: Form(
        key : _formKey,
        child: Column (
          children: <Widget>[
            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return 'Please type an email';
                }
              },
              onSaved : (input) => _email = input,
              decoration : InputDecoration(
                labelText : "Email",
              ),
            ),
            TextFormField(
              validator: (input){
                if(input.length < 6){
                  return 'Please provide a valid password';
                }
              },
              onSaved : (input) => _password = input,
              decoration : InputDecoration(
                labelText : "Password",
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed : signIn,
              child : Text('Sign in'),
            )
          ],
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