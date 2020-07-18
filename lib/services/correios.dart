import 'package:etrack/classes/package.dart';
import 'package:flutter_correios/flutter_correios.dart';
import 'package:flutter_correios/model/objeto_rastreio.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;

class Object {

  String erro;

  String numero;
  String sigla;
  String nome;
  String categoria;

  String tipo;
  String status;
  String data;
  String hora;
  String descricao;
  String detalhe;
  String local;
  String codigo;
  String cidade;
  String uf;

  Object(Iterable<xml.XmlElement> obj) {

    try{
      erro=obj.first.findElements("erro").first.text;

    }catch(e){

      numero=obj.first.findElements("numero").first.text;
      sigla=obj.first.findElements("sigla").first.text;
      nome=obj.first.findElements("nome").first.text;
      categoria=obj.first.findElements("categoria").first.text;

      tipo=obj.first.findAllElements("evento").toList()[0].findElements("tipo").first.text;
      status=obj.first.findAllElements("evento").toList()[0].findElements("status").first.text;
      data=obj.first.findAllElements("evento").toList()[0].findElements("data").first.text;
      hora=obj.first.findAllElements("evento").toList()[0].findElements("hora").first.text;
      descricao=obj.first.findAllElements("evento").toList()[0].findElements("descricao").first.text;
      detalhe=obj.first.findAllElements("evento").toList()[0].findElements("detalhe").first.text;
      local=obj.first.findAllElements("evento").toList()[0].findElements("local").first.text;
      codigo=obj.first.findAllElements("evento").toList()[0].findElements("codigo").first.text;
      cidade=obj.first.findAllElements("evento").toList()[0].findElements("cidade").first.text;
      uf=obj.first.findAllElements("evento").toList()[0].findElements("uf").first.text;

    }

  }

}

Future<String> callCorreiosRastreamento(String code)  async {


  String envelope =
      "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" "
          +"xmlns:res=\"http://resource.webservice.correios.com.br/\"> "
          +"   <soapenv:Header/> "
          +"   <soapenv:Body>  "
          +"      <res:buscaEventosLista> "
          +"         <usuario>ECT</usuario> "
          +"         <senha>SRO</senha>  "
          +"         <tipo>L</tipo>  "
          +"         <resultado>T</resultado>  "
          +"         <lingua>101</lingua> "
          +"         <objetos>"+code+"</objetos> "
          +"      </res:buscaEventosLista>  "
          +"   </soapenv:Body> "
          +"</soapenv:Envelope>"
  ;

  final response =
  await http.post("http://webservice.correios.com.br:80/service/rastro",
    headers: {"Content-Type": "text/xml",
    },body: envelope,);

  Object objeto = Object(xml.parse(response.body).findAllElements("objeto"));

  print(objeto.descricao);

  return objeto.status;

}
