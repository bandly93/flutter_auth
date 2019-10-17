import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget{

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
                buildButton(context, 300, "SIGN UP", TextStyle(color : Colors.white), '/signup', Colors.transparent),
                buildButton(context, 300, "CONTINUE WITH FACEBOOK", TextStyle(color:Colors.white), '/login', Colors.blue),
                buildButton(context, 300, "LOG IN ", TextStyle(color:Colors.black), '/login', Colors.white),
              ],
            )
          ],
        )
      )
    );
  }
}