import 'package:flutter/material.dart';
import 'package:squish_app/common/gradientContainer.dart';
import 'package:squish_app/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:squish_app/pages/login_page.dart';

class SignupPage extends StatefulWidget{
  @override
  _SignupPage createState() => new _SignupPage();
}

class _SignupPage extends State<SignupPage>{
  String _firstName ,_lastName ,_email ,_password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Future<void> signUp() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        AuthResult newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email : _email,password:_password);
        print(newUser);
        Navigator.push(context,MaterialPageRoute(builder:(context) => LoginPage()));
      }catch(e){
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body : Container(
        decoration: gradient(colors,Alignment.topCenter,Alignment.bottomCenter),
        child : Form (
          key : _formKey,
          child : Column(
            children: <Widget>[
              //navbar here
              Container(
                child : Padding(
                  padding : EdgeInsets.all(32),
                  child : Wrap(
                    runSpacing : 20,
                    children : <Widget>[
                      Center(
                        child : Text('Sign Up'),
                      ),
                      TextFormField(
                        validator: (input) => input.isEmpty ? 'Please enter your first name' : null,
                        onSaved : (input) => _firstName = input,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled : true,
                          hintText : 'First Name',
                          hintStyle: const TextStyle(color : Colors.white),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border : OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          prefixIcon: null,
                        )
                      ),
                      TextFormField(
                        validator: (input) => input.isEmpty ? 'Please enter your last name' : null,
                        onSaved : (input) => _lastName = input,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled : true,
                          hintText : 'Last Name',
                          hintStyle: const TextStyle(color : Colors.white),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border : OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          prefixIcon: null,
                        )
                      ),
                      TextFormField(
                        validator: (input) => input.isEmpty? 'Please enter your email.' : null,
                        onSaved : (input) => _email = input,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled : true,
                          hintText : 'Email Address',
                          hintStyle: const TextStyle(color : Colors.white),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border : OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          prefixIcon: null,
                        )
                      ),
                      TextFormField(
                        validator: (input) => input.isEmpty ? 'Please enter a valid password' : null,
                        onSaved : (input) => _password = input,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled : true,
                          hintText : 'Password',
                          hintStyle: const TextStyle(color : Colors.white),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border : OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          prefixIcon: null,
                        )
                      ),
                      RaisedButton(
                        color: Color.fromRGBO(255, 255, 255, 0),
                        shape : RoundedRectangleBorder(borderRadius : new BorderRadius.circular(30.0)),
                        onPressed : signUp,
                        child : Text('Submit')
                      )
                    ]
                  )
                )
              )
            ],
          )
        )
      )
    );
  }
}