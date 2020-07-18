import 'dart:convert';

import 'package:http/http.dart' as http;

getCorreiosRastreamento() async{
  //OK283206725BR
  String teste;
  final response = await http.get("https://api.linketrack.com/track/json?user=teste&token=1abcd00b2731640e886fb41a8a9671ad1434c599dbaa0a0de9a5aa619f29a83f&codigo=OK283206725BR");
  if(response.statusCode == 200){

    var decodeJson = jsonDecode(response.body);
    print(decodeJson['eventos'][0]["status"]);
  }
}