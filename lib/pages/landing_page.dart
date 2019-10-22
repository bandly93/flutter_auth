import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LandingPage extends StatefulWidget{
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>{

  bool isLogginIn = false;
 

  Widget buildButton(context,width,text,textStyle,route,color){
    return SizedBox(
      width : 300,
      child : RaisedButton(
        color: color,
        shape : RoundedRectangleBorder(borderRadius : new BorderRadius.circular(30.0)),
        onPressed : (){
          Navigator.pushNamed(context, route);
        },
        child : Text(text , style : textStyle),
      ),
    );
  }

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      isLoggedIn = isLoggedIn;
    });
  }

  Future<void> signInWithFacebook() async {

    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logInWithReadPermissions(['email']);
    switch (result.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        onLoginStatusChanged(true);
        break;
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body : Container(
        padding: new EdgeInsets.fromLTRB(70, 0, 70, 0),
        child : Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Squish'),
            Text('Your Mobile Abstract Diary'),
            Column (
              children: <Widget>[
                SizedBox(
                  width : 300,
                  child : RaisedButton(
                    color: Colors.transparent,
                    shape : RoundedRectangleBorder(borderRadius : new BorderRadius.circular(30.0)),
                    onPressed : (){
                      Navigator.pushNamed(context, '/signup');
                    },
                    child : Text("Sign Up" , style : TextStyle(color : Colors.white)),
                  ),
                ),
                SizedBox(
                  width : 300,
                  child : RaisedButton(
                    color: Colors.blue,
                    shape : RoundedRectangleBorder(borderRadius : new BorderRadius.circular(30.0)),
                    onPressed : signInWithFacebook,
                    child : Text("CONTINUE WITH FACEBOOK" , style : TextStyle(color:Colors.white)),
                  ),
                ),
                SizedBox(
                  width : 300,
                  child : RaisedButton(
                    color: Colors.white,
                    shape : RoundedRectangleBorder(borderRadius : new BorderRadius.circular(30.0)),
                    onPressed : (){
                      Navigator.pushNamed(context, '/login');
                    },
                    child : Text("LOG IN" , style : TextStyle(color:Colors.black)),
                  ),
                ),
              ],
            )
          ],
        )
      )
    );
  }
}