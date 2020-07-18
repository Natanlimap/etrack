import 'package:etrack/assets/styleGuide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

BoxDecoration delivered(){
  return BoxDecoration(
      color: green
  );
}
BoxDecoration waiting(){
  return BoxDecoration(
      color: Colors.grey
  );
}
BoxDecoration fowarded(){
  return BoxDecoration(
      color: primaryOrange
  );
}