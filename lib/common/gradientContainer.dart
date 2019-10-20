import 'package:flutter/material.dart';

BoxDecoration gradient(colors,Alignment start,Alignment end){
  return BoxDecoration(
    gradient: LinearGradient(
      begin: start,
      end: end,
      stops: [0.1,0.3,0.8],
      colors: colors,
    ),
  );
}