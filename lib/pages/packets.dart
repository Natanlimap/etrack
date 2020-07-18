import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PacketsMain extends StatefulWidget {
  @override
  _PacketsMainState createState() => _PacketsMainState();
}

class _PacketsMainState extends State<PacketsMain> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
          body: Column(
            children: <Widget>[
              Container(

                height: size.height*0.3,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: size.width,
                      padding: EdgeInsets.only(left: 20, bottom: 50),
                      height: size.height*0.3 - 27,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(36),
                          bottomLeft: Radius.circular(36)
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: size.width*0.5, bottom: 10),
                            child: Text(
                              "Suas encomendas em um só lugar, de um jeito simples, rápido e fácil.",
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12
                              ),
                            ),
                          ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget>[
                             Text(
                               "Pacotes",
                               style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 38
                               ),
                             )
                           ],
                         )
                        ],
                      ),
                    ),

                    //positioning  form
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Colors.black26
                            )
                          ]
                        ),

                        //tracking code form
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Insira o código de rastreio",
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            Icon(Icons.search, color: Colors.black26,)
                          ],
                        )
                      ),
                    )

                  ],
                ),
              ),

              //package list
              Expanded(
                child: ListView(
                  children: <Widget>[

                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}


