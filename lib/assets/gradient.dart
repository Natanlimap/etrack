import 'package:etrack/assets/styleGuide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//background containers gradient
BoxDecoration mainBackground(){
  return BoxDecoration(
      gradient: LinearGradient(
        colors: [primaryPink, primaryOrange],
        stops: [0.2,0.7],
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
      )
  );
}

//decoration for delivered packages
BoxDecoration delivered(){
  return BoxDecoration(
      color: primaryOrange
  );
}


//decoration for loading package info
BoxDecoration waiting(){
  return BoxDecoration(
      color: Colors.grey
  );
}


//decoration for fowarded packages
BoxDecoration fowarded(){
  return BoxDecoration(
      color: primaryOrange
  );
}