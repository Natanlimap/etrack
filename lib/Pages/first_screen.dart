import 'package:flutter/material.dart';

class Firstscreen extends StatefulWidget {
  @override
  _FirstscreenState createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffFE7B43),
                Color(0xffF5336F),
              ],
            ),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 101),
                  child: Icon(
                    Icons.account_box,
                    size: 132,
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'E-',
                        style: TextStyle(fontSize: 48),
                      ),
                      Text(
                        'Track',
                        style:
                            TextStyle(color: Color.fromRGBO(245, 15, 86, 100), fontSize: 48),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 61,
                    right: 47,
                    left: 47,
                  ),
                  child: Text(
                    'Suas encomendas em um só lugar, de um jeito simples, rápido e fácil.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 69,
                  ),
                  child: CircularProgressIndicator(
                    value: null,
                    strokeWidth: 7.0,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
