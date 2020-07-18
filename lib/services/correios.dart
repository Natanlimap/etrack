import 'package:flutter_correios/flutter_correios.dart';
import 'package:flutter_correios/model/objeto_rastreio.dart';

Future<String> rastrear(String codigo) async{

  final FlutterCorreios fc = FlutterCorreios();

  ObjetoRastreio objeto = await fc.fazerRastreio(codRastreio: codigo);

  for(Historico historico in objeto.historico){
    return historico.situacao;
  }
}