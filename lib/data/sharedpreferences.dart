import 'package:shared_preferences/shared_preferences.dart';

Future<List<List<String>>> getInfoFromSharedPref() async{
  final prefs = await SharedPreferences.getInstance();
  final codeList = prefs.getStringList("codes");
  final nameList = prefs.getStringList("names");

  print(codeList);

  if(codeList == null){
    return List();
  }else{
    return [codeList, nameList];
  }
}