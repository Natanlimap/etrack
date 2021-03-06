import 'package:etrack/assets/gradient.dart';
import 'package:etrack/pages/packets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Firstscreen extends StatefulWidget {
  @override
  _FirstscreenState createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  void pageNavigation() {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => PacketsMain()),
    );
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 2), pageNavigation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          decoration: mainBackground(),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: size.height * 0.2),
                    child: Image(
                      image: AssetImage("assets/images/Logo.png"),
                      width: size.width * 0.4,
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.1,
                      left: size.width * 0.1,
                      right: size.width * 0.1,
                      bottom: size.height * 0.2),
                  child: Text(
                      "Suas encomendas em um só lugar, de um jeito simples, rápido e fácil." , textAlign: TextAlign.center,style: TextStyle(color: Colors.white70, fontSize: 20),),
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                      value: null,
                      strokeWidth: 10.0,
                      backgroundColor: Colors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xffFE7B43))),
                ),
              ],
            ),
          )),
    );
  }
}
