import 'package:etrack/assets/gradient.dart';
import 'package:etrack/data/getSavedPackages.dart';
import 'package:etrack/controllers/package_model.dart';
import 'package:etrack/services/correios.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';


//Package list controller
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store{

  //list that manage all packages from first page
  @observable
  ObservableList<PackageModel> listItems = ObservableList();


  //gets a package, add it on the back, get the package's real status
  //and refresh that specific card
  //Besides that, change the bottom background from package card
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
        case "Objeto entregue ao destinatário":
          listItems[listItems.length - 1].setCardStatus(delivered());
      }
    }

    //save that list on local storage
    attListInPref(listItems);
  }


  //remove the package if it has the same name and code
  @action
  removeItem(PackageModel pack){
    listItems.removeWhere((item)=> item.title == pack.title && item.code == pack.code);
    attListInPref(listItems);
  }


}