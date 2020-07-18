import 'package:etrack/pages/packets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Firstscreen extends StatefulWidget {
  @override
  _FirstscreenState createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {



  void pageNavigation(){
   Navigator.push(
     context, CupertinoPageRoute(builder: (context) => PacketsMain()),
   );
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), pageNavigation);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;

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
                  padding: EdgeInsets.only(top: size.height*0.3),
                  child: Image(image: AssetImage("assets/images/icon.png"),width: size.width*0.3,)
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'E-',
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70
                        ),
                      ),
                      Text(
                        'Track',
                        style:
                            TextStyle(color: Colors.white70, fontSize: 48, fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    top: size.height*0.2,
                  ),
                ),
                SizedBox(
                    height: 191,
                    width: 191,
                    child: CircularProgressIndicator(
                      value: null,
                      strokeWidth: 10.0,
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFE7B43))
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
