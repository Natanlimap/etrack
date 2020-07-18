import 'package:etrack/assets/styleGuide.dart';
import 'package:flutter/cupertino.dart';

BoxDecoration mainBackground(){
  return BoxDecoration(
      gradient: LinearGradient(
        colors: [primaryPink, primaryOrange],
        end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
      )
  );
}