// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PackageModel on _PackageModelBase, Store {
  final _$titleAtom = Atom(name: '_PackageModelBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$codeAtom = Atom(name: '_PackageModelBase.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$statusAtom = Atom(name: '_PackageModelBase.status');

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$_PackageModelBaseActionController =
      ActionController(name: '_PackageModelBase');

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_PackageModelBaseActionController.startAction(
        name: '_PackageModelBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_PackageModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCode(String value) {
    final _$actionInfo = _$_PackageModelBaseActionController.startAction(
        name: '_PackageModelBase.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$_PackageModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStatus(String value) {
    final _$actionInfo = _$_PackageModelBaseActionController.startAction(
        name: '_PackageModelBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$_PackageModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
code: ${code},
status: ${status}
    ''';
  }
}
