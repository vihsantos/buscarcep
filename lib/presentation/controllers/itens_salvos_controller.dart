// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:busca_cep/utils/error/db_exception_if.dart';
import 'package:busca_cep/utils/error/db_exception_imp.dart';

import '../../models/endereco.dart';
import '../../repository/data_base_helper.dart';

class ItensSalvosController {
  List<Endereco>? enderecos;

  final loadingApi = ValueNotifier<bool>(false);
  set loading(bool bool) => loadingApi.value = bool;

  DbExceptionIf? error;

  ItensSalvosController() {
    _initialize();
  }

  Future<void> buscarEnderecos() async {
    loading = true;
    error = null;
    try {
      enderecos = await DataBaseHelper.instance.getEnderecos();
    } catch (e) {
      error = DbExceptionImp(message: e.toString());
    }
    loading = false;
  }

  void _initialize() {
    buscarEnderecos();
  }
}
