import 'package:flutter/cupertino.dart';

BoxDecoration mainBackground(){
  return BoxDecoration(
      gradient: LinearGradient(
        colors: [Color.fromRGBO(254, 123, 67, 100), Color.fromRGBO(245, 51, 111, 100)],
        end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
      )
  );
}