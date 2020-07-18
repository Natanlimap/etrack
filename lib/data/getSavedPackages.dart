import 'package:etrack/data/sharedpreferences.dart';
import 'package:etrack/models/package_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

void sharedDataToPackage(final controller) async{
  List<List<String>> data = List();
  data = await getInfoFromSharedPref();
  for(int i =0 ; i < data[0].length; ++i){
    controller.addItem(PackageModel(code: data[0][i], title: data[1][i]));
  }
}

Future<void> attListInPref(ObservableList<PackageModel> listItems ) async{
  final prefs = await SharedPreferences.getInstance();
  List<String> names = List();
  List<String> codes = List();

  for(PackageModel item in listItems){
    print(item.code);
    names.add(item.title);
    codes.add(item.code);
  }
  await prefs.setStringList("names", names);
  await prefs.setStringList("codes", codes);

}