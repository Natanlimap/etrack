import 'package:etrack/assets/gradient.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'package_model.g.dart';


class PackageModel = _PackageModelBase with _$PackageModel;


abstract class _PackageModelBase with Store{

  _PackageModelBase({this.title = "", this.code = "", this.status = "Aguardando"}){
    cardStatus = waiting();
  }

  @observable
  String title;

  @observable
  String code;

  @observable
  String status;

  @observable
  BoxDecoration cardStatus;

  @action
  setCardStatus(BoxDecoration value) => cardStatus = value;

  @action
  setTitle(String value) => title = value;

  @action
  setCode(String value) => code = value;

  @action
  setStatus(String value) => status = value;
}