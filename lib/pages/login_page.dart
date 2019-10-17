import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:squish_app/pages/home.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => new _LoginPageState();
}

enum FormType {
  login,
  register
}

class _LoginPageState extends State<LoginPage>{
  String _email, _password;
  FormType _formType = FormType.login;
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
          children: buildInput() + buildButton(),
        ),
      ),
    );
  }


  List<Widget> buildButton(){
    if(_formType == FormType.login){
      return [
        RaisedButton(
          onPressed : signIn,
          child : Text('Log in'),
        ),
        FlatButton(
          child : Text('Create an account', style : new TextStyle(fontSize :20.0)),
          onPressed: moveToRegister,
        )
      ];
    }else{
      return [
        RaisedButton(
          onPressed : signIn,
          child : Text('Register User'),
        ),
        FlatButton(
          child : Text('Have an account ? Login', style : new TextStyle(fontSize :20.0)),
          onPressed: moveToLogin,
        )
      ];

    }
  }

   List<Widget> buildInput(){
      return [
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
      ];
    }

  void moveToRegister(){
    _formKey.currentState.reset();
    setState(()=>_formType = FormType.register);
  }

  void moveToLogin(){
    _formKey.currentState.reset();
    setState(() => _formType = FormType.login);
  }

  Future<void> signIn() async {
    //Todo validate fields
    //Todo Login to firebase
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try {
        if(_formType == FormType.login){
          AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email : _email,password : _password);
          Navigator.push(context,MaterialPageRoute(builder:(context)=> Home()));
        }else{
          AuthResult user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email : _email , password: _password);
          print('Registered user: ${user}');
        }
      }catch(e){
        print(e.message);
      }

    }
  }
}