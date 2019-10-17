import 'package:flutter/material.dart';

Widget buildTextForm(text,icon){
  final iconLogic = Icon(icon,color:Colors.white,size:24.0);
  return TextFormField(
    decoration: InputDecoration(
      fillColor: Colors.transparent,
      filled : true,
      hintText : text,
      hintStyle: const TextStyle(color : Colors.white),
      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      border : OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      prefixIcon: iconLogic,
    )
  );
}