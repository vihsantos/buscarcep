import 'package:busca_cep/repository/data_base_helper.dart';
import 'package:flutter/cupertino.dart';
import '../../models/endereco.dart';
import '../../repository/buscar_cep_repository.dart';
import '../../utils/error/cep_exception_if.dart';

class BuscaController {
  BuscarCepRepository repository;
  BuscaController({
    required this.repository,
  });

  Endereco? endereco;

  final loadingApi = ValueNotifier<bool>(false);
  set loading(bool bool) => loadingApi.value = bool;

  CepExceptionIf? error;

  Future<void> buscarCep(String cep) async {
    loading = true;
    error = null;
    try {
      endereco = await repository.buscarCep(cep) as Endereco;
    } on CepExceptionIf catch (e) {
      error = e;
    }
    loading = false;
  }

  Future salvarEndereco(Endereco endereco) async {
    await DataBaseHelper.instance.insert(endereco);
  }
}
