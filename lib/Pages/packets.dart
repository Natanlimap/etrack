import 'package:etrack/assets/styleGuide.dart';
import 'package:etrack/classes/package.dart';
import 'package:etrack/data/getSavedPackages.dart';
import 'package:etrack/controllers/package_model.dart';
import 'package:etrack/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

TextEditingController codeController = TextEditingController();
TextEditingController nameController = TextEditingController();
List<Package> clientepackagelist = List();




class PacketsMain extends StatefulWidget {
  @override
  _PacketsMainState createState() => _PacketsMainState();
}

class _PacketsMainState extends State<PacketsMain> {


  final controller = HomeController();


  @override
  void initState() {
    sharedDataToPackage(controller);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    _displayDialogForvalidate(BuildContext context) async{
      return showDialog(

          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Insira um código válido primeiro', style: TextStyle(color: primaryOrange),),

              actions: <Widget>[
                new FlatButton(
                  child: new Text('Ok', style: TextStyle(color: primaryOrange),),
                  onPressed: () async{
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
    _displayDialog(BuildContext context) async {

      var model = PackageModel();

      return showDialog(

          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Novo pacote', style: TextStyle(color: primaryOrange)),
              content: TextField(
                onChanged: model.setTitle,
                decoration: InputDecoration(hintText: "Insira o nome do pacote" ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('CONFIRMAR', style: TextStyle(color: primaryOrange)),
                  onPressed: () async{
                    model.setCode(codeController.text);
                    controller.addItem(model);

                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text('CANCELAR', style: TextStyle(color: primaryOrange)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }

    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: primaryOrange,
            child: Icon(Icons.add),
            onPressed: ()=>{
              if(codeController.text == ''){
                _displayDialogForvalidate(context),
              }else{
                _displayDialog(context),
              }
            }
        ),
        body: Column(
          children: <Widget>[
            customAppBar(size),

            //package list
            Expanded(
              child: Observer(
                builder: (_){
                  return ListView.builder(
                      padding: EdgeInsets.only(top: 12),
                      itemCount: controller.listItems.length,
                      itemBuilder: (context, index){
                        var item = controller.listItems[index];
                        return packageItem(size, item);
                      }
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget packageItem(

      Size size, PackageModel pack) {

    return Observer(
        builder: (_) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Card(
                elevation: 10,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: size.height * 0.1,
                      child: ListTile(
                        leading: Image(image: AssetImage("./assets/images/Caixa.png"),  height: size.height*0.05,),
                        title: Text(pack.title),
                        subtitle: Text(
                          "Codigo: " + pack.code,
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            controller.removeItem(pack);
                          },
                          child: Icon(Icons.close),
                        ),
                      ),
                    ),

                    //package status line
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: packageLineStatus(size, pack.status),
                    ),

                    //bottom card section
                    Container(
                      decoration: pack.cardStatus,
                      height: size.height * 0.05,
                      child: Center(
                        child: Text(
                          pack.status,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )),
          );
        }
    );
  }
}



//widget that recieves the package status and return it visually
Widget packageLineStatus(Size size, String status) {
  Color postado;
  Color trajeto;
  Color entregue;
  Color fontentregue;
  Color fonttrajeto;
  //changing the color as of package status
  switch (status) {
    case "Objeto postado":
      postado = primaryOrange;
      trajeto = Colors.grey;
      entregue = Colors.grey;
      fontentregue = Colors.white;
      fonttrajeto = Colors.white;

      break;
    case "Objeto encaminhado":
      postado = primaryOrange;
      trajeto = primaryOrange;
      entregue = Colors.grey;
      fontentregue = Colors.white;
      fonttrajeto = Colors.black54;
      break;

    case "Objeto entregue ao destinatário":

      postado = primaryOrange;
      trajeto = primaryOrange;
      entregue = primaryOrange;
      fontentregue = Colors.black54;
      fonttrajeto = Colors.black54;
      break;

    default:
      postado = Colors.grey;
      trajeto = Colors.grey;
      entregue = Colors.grey;
      break;
  }

  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                color: postado, borderRadius: BorderRadius.circular(100)),
          ),
          Container(
            width: size.width * 0.3,
            height: 2,
            decoration: BoxDecoration(
              color: trajeto,
            ),
          ),
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                color: trajeto, borderRadius: BorderRadius.circular(100)),
          ),
          Container(
            width: size.width * 0.3,
            height: 2,
            decoration: BoxDecoration(
              color: entregue,
            ),
          ),
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                color: entregue, borderRadius: BorderRadius.circular(100)),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Row(
          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Objeto postado",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 8
              ),

            ),
            Text(
              "Objeto em trajeto",
              style: TextStyle(
                  color: fonttrajeto,
                  fontSize: 8
              ),

            ),
            Text(
              "Objeto entregue",
              style: TextStyle(
                  color: fontentregue,
                  fontSize: 8
              ),

            ),
          ],
        ),
      )
    ],
  );
}

Widget customAppBar(Size size) {
  return Container(
    height: size.height * 0.3,
    child: Stack(
      children: <Widget>[
        Container(
          width: size.width,
          padding: EdgeInsets.only(left: 20, bottom: 50),
          height: size.height * 0.3 - 27,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryPink, primaryOrange],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(36),
                  bottomLeft: Radius.circular(36))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: size.width * 0.5, bottom: 10),
                child: Text(
                  "Suas encomendas em um só lugar, de um jeito simples, rápido e fácil.",
                  style: TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
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
                        fontSize: 38),
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
                        color: Colors.black26)
                  ]),

              //tracking code form
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: codeController,
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
                  Icon(
                    Icons.search,
                    color: Colors.black26,
                  )
                ],
              )),
        )
      ],
    ),
  );
}
