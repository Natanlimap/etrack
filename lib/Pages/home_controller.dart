import 'package:etrack/models/package_model.dart';
import 'package:etrack/services/correios.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';


class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store{

  @observable
  ObservableList<PackageModel> listItems = [
    PackageModel(),
  ].asObservable();

  @action
  addItem(PackageModel pack) async{
    String status = await getCorreiosRastreamento(pack.code);
    if(status != "error"){
      pack.setStatus(status);
      listItems.add(pack);
    }

  }

  @action
  removeItem(PackageModel pack){
    listItems.removeWhere((item)=> item.title == pack.title && item.code == pack.code);
  }

}