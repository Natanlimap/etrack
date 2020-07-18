import 'package:etrack/assets/gradient.dart';
import 'package:etrack/data/getSavedPackages.dart';
import 'package:etrack/models/package_model.dart';
import 'package:etrack/services/correios.dart';
import 'package:mobx/mobx.dart';
part '../models/home_controller.g.dart';


class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store{

  @observable
  ObservableList<PackageModel> listItems = ObservableList();

  @action
  addItem(PackageModel pack) async{
    listItems.add(pack);
    String status = await getCorreiosRastreamento(pack.code);
    if(status != "error"){
      listItems[listItems.length - 1].setStatus(status);
      listItems.toSet();

      switch (status){
        case "Aguardando":
          print("entrei");
          listItems[listItems.length - 1].setCardStatus(waiting());
          break;
        case "Objeto encaminhado":
          listItems[listItems.length - 1].setCardStatus(fowarded());
          break;
        case "Objeto entregue":
          listItems[listItems.length - 1].setCardStatus(delivered());
      }
    }
    attListInPref(listItems);
  }


  @action
  removeItem(PackageModel pack){
    listItems.removeWhere((item)=> item.title == pack.title && item.code == pack.code);
    attListInPref(listItems);
  }


}